class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true
      t.string :status
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
