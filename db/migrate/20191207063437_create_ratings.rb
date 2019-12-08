class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :star
      t.string :title
      t.string :description
      t.string :pros
      t.string :cons
      t.string :advice
      t.references :college, foreign_key: true
      t.references :student, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
