class CreateEasterEggs < ActiveRecord::Migration
  def change
    create_table :easter_eggs do |t|
      t.string :title
      t.text :description
      t.references :user, index: true
      t.references :movie, index: true

      t.timestamps
    end
  end
end
