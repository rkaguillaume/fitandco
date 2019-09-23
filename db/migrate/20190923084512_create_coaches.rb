class CreateCoaches < ActiveRecord::Migration[5.2]
  def change
    create_table :coaches do |t|
      t.string :name
      t.string :specialisation
      t.string :picture
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
