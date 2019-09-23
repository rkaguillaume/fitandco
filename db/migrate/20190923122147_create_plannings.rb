class CreatePlannings < ActiveRecord::Migration[5.2]
  def change
    create_table :plannings do |t|
      t.string :title
      t.string :plan_img
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
