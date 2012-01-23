class AddHtmlToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :html, :binary
  end
  
  
end
