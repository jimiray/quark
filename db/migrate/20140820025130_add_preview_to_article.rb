class AddPreviewToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :preview, :text
  end
end
