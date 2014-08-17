class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :slug
      t.boolean :featured
      t.timestamp :published_at
      t.timestamps
    end
  end
end
