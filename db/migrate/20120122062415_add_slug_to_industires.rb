class AddSlugToIndustires < ActiveRecord::Migration
  def change
    add_column :industries, :slug, :string
    add_index :industries, :slug
  end
end
