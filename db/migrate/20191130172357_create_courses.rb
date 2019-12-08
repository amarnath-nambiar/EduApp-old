class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :full_name
      t.string :short_name
      t.string :about
      t.text :description
      t.boolean :archived
      t.datetime :deleted_at
      t.references :college, foreign_key: true

      t.timestamps
    end
  end
end
