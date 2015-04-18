class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :title
      t.text :description
      t.references :user, index: true
      t.references :movie, index: true
      t.boolean :fictional

      t.timestamps
    end
  end
end
