class CreateAirlines < ActiveRecord::Migration[6.0]
  def change
    create_table :airlines do |t|
      t.string :name, null: false
      t.text :image_url, null: false
      t.string :slug, null: false

      t.timestamps
    end
  end
end
