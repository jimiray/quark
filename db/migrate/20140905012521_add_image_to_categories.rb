class AddImageToCategories < ActiveRecord::Migration

  def change
    add_column :categories, :image_file_name, :string
  end

end
