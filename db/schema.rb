# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_16_142108) do

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "related_talks", force: :cascade do |t|
    t.integer "talk_id"
    t.string "avatar"
    t.string "speaker"
    t.string "title"
    t.integer "duration"
    t.string "slug"
    t.integer "viewed_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["talk_id"], name: "index_related_talks_on_talk_id"
  end

  create_table "speakers", force: :cascade do |t|
    t.string "name"
    t.string "occupation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_talks", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "talk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_tag_talks_on_tag_id"
    t.index ["talk_id"], name: "index_tag_talks_on_talk_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "talk_ratings", force: :cascade do |t|
    t.integer "talk_id"
    t.integer "rating_id"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rating_id"], name: "index_talk_ratings_on_rating_id"
    t.index ["talk_id"], name: "index_talk_ratings_on_talk_id"
  end

  create_table "talks", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.text "description"
    t.integer "event_id"
    t.integer "speaker_id"
    t.integer "views"
    t.datetime "published_date"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_talks_on_event_id"
    t.index ["speaker_id"], name: "index_talks_on_speaker_id"
  end

end
