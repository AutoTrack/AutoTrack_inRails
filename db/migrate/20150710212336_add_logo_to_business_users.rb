class AddLogoToBusinessUsers < ActiveRecord::Migration
  def self.up
    add_attachment :business_users, :logo
  end

  def self.down
    remove_attachment :business_users, :logo

  end
end
