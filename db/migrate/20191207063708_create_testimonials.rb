class CreateTestimonials < ActiveRecord::Migration[5.2]
  def change
    create_table :testimonials do |t|
      t.string :author_name
      t.string :description
      t.references :college, foreign_key: true
      t.string :about_author
      t.date :deleted_at

      t.timestamps
    end
  end
end
