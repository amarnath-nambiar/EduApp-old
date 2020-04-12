class CreateColleges < ActiveRecord::Migration[5.2]
  def change
    create_table :colleges do |t|
      t.string :full_name
      t.string :code
      t.string :address
      t.string :city
      t.string :country
      t.string :about
      t.text :description
      t.string :website
      t.boolean :archived
      t.datetime :deleted_at
      t.references :agent,foreign_key: true

      t.timestamps
    end
  end
end
