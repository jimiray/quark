class AddSocialToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_handle, :string
    add_column :users, :linked_in_url, :string
    add_column :users, :google_plus_url, :string
  end
end
