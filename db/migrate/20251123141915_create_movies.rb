class CreateMovies < ActiveRecord::Migration[7.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :overview
      t.string :poster_url
      t.integer :rating

      t.timestamps
    end
  end
end
