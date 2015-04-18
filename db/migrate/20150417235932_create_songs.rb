class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.text :description
      t.references :user, index: true
      t.references :movie, index: true

      t.timestamps
    end
  end
end
