class AddTimesRankedToUser < ActiveRecord::Migration
  def change
  	add_column :users, :times_ranked, :integer, default: 0
  end
end
