class CreateAirlines < ActiveRecord::Migration[6.0]
  def change
    create_table :airlines do |t|
      t.string :name
      t.text :image_url
      t.string :slug

      t.timestamps
    end
  end
end
