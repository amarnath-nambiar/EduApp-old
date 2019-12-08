class CreateAgents < ActiveRecord::Migration[5.2]
  def change
    create_table :agents do |t|
      t.string :first_name
      t.string :last_name
      t.string :encrypted_phone
      t.string :encrypted_alt_phone
      t.string :about
      t.string :image_url
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
