class CreateCommons < ActiveRecord::Migration
  def change
    create_table :commons do |t|
      t.string :title
      t.text :description
      t.references :user, index: true
      t.references :movie, index: true

      t.timestamps
    end
  end
end
