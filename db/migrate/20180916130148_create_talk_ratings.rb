class CreateTalkRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :talk_ratings do |t|
      t.references :talk, foreign_key: true
      t.references :rating, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end
