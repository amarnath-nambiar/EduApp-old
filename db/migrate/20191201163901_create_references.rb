class CreateReferences < ActiveRecord::Migration[5.2]
  def change
    create_table :references do |t|
      t.string :full_name
      t.string :encrypted_phone
      t.references :student, foreign_key: true
      t.string :status
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
