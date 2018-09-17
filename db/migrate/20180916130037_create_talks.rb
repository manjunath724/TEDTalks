class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :talks do |t|
      t.string :name
      t.string :title
      t.text :description
      t.references :event, foreign_key: true
      t.references :speaker, foreign_key: true
      t.integer :views
      t.datetime :published_date
      t.string :url

      t.timestamps
    end
  end
end
