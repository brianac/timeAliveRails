class SplitNameIntoFirstnameAndLastname < ActiveRecord::Migration
  def up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    User.all.each do |person|
      person.update_attributes! :first_name => person.name.rpartition(" ").first
      person.update_attributes! :last_name => person.name.rpartition(" ").last
    end

    remove_column :users, :name
  end



end