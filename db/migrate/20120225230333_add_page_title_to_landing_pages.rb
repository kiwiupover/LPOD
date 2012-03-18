class AddPageTitleToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :page_title, :string 
    add_column :landing_pages, :related_keywords, :string
    add_column :landing_pages, :alexa_rating, :string 
    add_column :landing_pages, :ppc_budget, :string
    add_column :landing_pages, :google_ppc_keywords, :string 
  end
end
