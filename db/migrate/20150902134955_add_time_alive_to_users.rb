class AddTimeAliveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :days_alive, :int
  end
end
