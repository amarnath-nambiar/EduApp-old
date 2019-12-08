class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.string :title
      t.string :description
      t.integer :parent_interest_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
