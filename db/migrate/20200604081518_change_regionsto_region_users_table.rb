class ChangeRegionstoRegionUsersTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :regions_id, :region_id
  end
end
