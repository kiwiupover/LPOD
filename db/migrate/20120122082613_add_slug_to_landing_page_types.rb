class AddSlugToLandingPageTypes < ActiveRecord::Migration
  def change
    add_column :landing_page_types, :slug, :string 
    add_index :landing_page_types, :slug
  end
end
