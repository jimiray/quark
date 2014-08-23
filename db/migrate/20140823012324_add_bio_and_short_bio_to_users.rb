class AddBioAndShortBioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :short_bio, :string
    add_column :users, :bio, :text
  end
end
