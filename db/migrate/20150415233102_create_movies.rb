class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :rated
      t.string :duration
      t.text :synopsis
      t.references :admin, index: true

      t.timestamps
    end
  end
end
