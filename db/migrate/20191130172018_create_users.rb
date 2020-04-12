class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :alt_phone
      t.string :about
      t.string :image_url
      t.datetime :deleted_at
      t.string :email
      t.string :password_digest
      t.string :referral_code
      t.string :referred_by
      t.string :city
      t.string :type

      t.timestamps
    end
  end
end
