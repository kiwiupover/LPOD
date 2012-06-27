class IndexOnLandingPageProperties < ActiveRecord::Migration
  def up
    execute "CREATE INDEX landing_pages_properties ON lading_pages USING GIN(properties)"
  end

  def down
    execute "DROP INDEX landing_pages_properties"
  end
end
