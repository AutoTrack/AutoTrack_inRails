class AddBusinessUserIdColumnToClients < ActiveRecord::Migration
  def change
    add_column :clients, :business_user_id, :integer
  end
end
