class ChangeOverviewTypeInMovies < ActiveRecord::Migration[7.2]
  def change
    change_column :movies, :overview, :text
  end
end
