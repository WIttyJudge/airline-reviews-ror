class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :score, null: false
      t.belongs_to :airline, null: false, foreign_key: true

      t.timestamps
    end
  end
end
