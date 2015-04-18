class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :title
      t.text :description
      t.references :user, index: true
      t.references :movie, index: true
      t.boolean :spoiler

      t.timestamps
    end
  end
end
