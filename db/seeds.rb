# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'yaml'

# Replace sample.csv with TED22kData.csv after fixing the error in the file(special characters are included like �� and additional comma , is present which has moved the column by 1).
csv = CSV.parse(open("db/sample.csv"), skip_blanks: true, headers: true, encoding: 'ISO-8859-1').delete_if { |row| row.to_hash.values.all?(&:blank?) }
csv.each do |row|
  e = Event.where(name: row[1]).first_or_create
  s = Speaker.where(name: row[2], occupation: row[7]).first_or_create
  t = Talk.where(description: row[0], name: row[3], published_date: Time.at(row[4].to_i), title: row[9], url: row[10], views: row[11], event: e, speaker: s).first_or_create
  YAML.load(row[5]).each do |h|
    r = Rating.where(name: h["name"]).first_or_create
    TalkRating.where(talk: t, rating: t, count: h["count"]).first_or_create
  end
  YAML.load(row[6]).each do |h|
    RelatedTalk.where(talk: t, avatar: h["hero"], speaker: h["speaker"], title: h["title"], duration: h["duration"], slug: h["slug"], viewed_count: h["viewed_count"]).first_or_create
  end
  YAML.load(row[8]).each do |a|
    tag = Tag.where(name: a).first_or_create
    TagTalk.where(talk: t, tag: tag).first_or_create
  end
end
