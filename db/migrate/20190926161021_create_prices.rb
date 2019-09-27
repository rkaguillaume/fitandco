class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.integer :price
      t.string :duration
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
