class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :alt_phone
      t.string :referral_code
      t.string :referred_by
      t.string :image_url
      t.string :city
      t.datetime :deleted_at
      t.string :password_digest
      t.string :reset_password_token
      t.string :reset_password_sent_at

      t.timestamps
    end
  end
end
