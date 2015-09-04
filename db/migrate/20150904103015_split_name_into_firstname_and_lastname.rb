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

def down # Merge first and last into name
    add_column :people, :name, :string
    Person.all.each do |person|
      person.update_column(:name, [person.attributes["first_name"].to_s, person.attributes["last_name"].to_s].reject(&:blank?).join(" "))
      person.save(:validate => false)
    end
    remove_column :people, :first_name
    remove_column :people, :last_name
  end