class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :emailbis
      t.string :address
      t.string :phone
      t.string :facebook
      t.string :youtube
      t.string :instagram
      t.string :twitter
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
