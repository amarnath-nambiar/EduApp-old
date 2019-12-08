class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.references :imageable, polymorphic: true
      t.string :url
      t.string :media_type
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
