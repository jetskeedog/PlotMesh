class CreateGoofs < ActiveRecord::Migration
  def change
    create_table :goofs do |t|
      t.string :title
      t.text :description
      t.references :user, index: true
      t.references :movie, index: true

      t.timestamps
    end
  end
end
