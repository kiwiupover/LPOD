class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.string :name
      t.string :image
      t.string :link

      t.timestamps
    end
  end
end
