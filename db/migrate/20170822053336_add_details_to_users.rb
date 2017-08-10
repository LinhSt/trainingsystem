class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :schools, :tring
    add_column :users, :graduation, :date
    add_column :users, :roles_id, :integer
    add_column :users, :avatar, :string
  end
end
