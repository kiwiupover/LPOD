class AddPropertiesToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :properties, :hstore 
  end
end
