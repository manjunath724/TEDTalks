class CreateTagTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_talks do |t|
      t.references :tag, foreign_key: true
      t.references :talk, foreign_key: true

      t.timestamps
    end
  end
end
