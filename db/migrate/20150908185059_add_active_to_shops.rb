class AddActiveToShops < ActiveRecord::Migration
  def change
    add_column :shops, :active, :boolean
  end
end
