class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :student, foreign_key: true
      t.string :user_name
      t.string :phone
      t.string :query

      t.timestamps
    end
  end
end
