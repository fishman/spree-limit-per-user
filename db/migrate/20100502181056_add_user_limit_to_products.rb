class AddUserLimitToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :limit_per_user, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :products, :limit_per_user
  end
end
