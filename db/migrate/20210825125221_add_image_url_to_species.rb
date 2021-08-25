class AddImageUrlToSpecies < ActiveRecord::Migration[6.0]
  def change
    add_column :species, :image_url, :string, default: "https://www.monrovia.com/media/catalog/product/cache/e5452c18e1c4fefc7252403522e22bd5/r/e/rest_1_1_11601.jpeg"
  end
end
