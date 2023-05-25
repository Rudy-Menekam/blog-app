class AddDevice < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string, default: "", null: false
    add_column :users, :encrypted_password, :string, default: '', null: false
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :remember_created_at, :datetime
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string

    add_index :users, :confirmation_token, name: "index_users_on_confirmation_token", unique: true
    add_index :users, :email, name: 'index_users_on_email', unique: true
    add_index :users, :reset_password_token, name: 'index_users_on_reset_password_token', unique: true
  end
end
