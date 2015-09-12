class AddUserTotalRating < ActiveRecord::Migration
  def change
  	add_column :users, :total_rating, :integer, default: 0
  end
end
