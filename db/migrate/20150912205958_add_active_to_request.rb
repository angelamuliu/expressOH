class AddActiveToRequest < ActiveRecord::Migration
  def change
  	add_column :requests, :active, :boolean
  end
end
