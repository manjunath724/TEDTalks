class CreateRelatedTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :related_talks do |t|
      t.references :talk, foreign_key: true
      t.string :avatar
      t.string :speaker
      t.string :title
      t.integer :duration
      t.string :slug
      t.integer :viewed_count

      t.timestamps
    end
  end
end
