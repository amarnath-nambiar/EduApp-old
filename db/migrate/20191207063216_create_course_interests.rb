class CreateCourseInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :course_interests do |t|
      t.references :course, foreign_key: true
      t.references :interest, foreign_key: true

      t.timestamps
    end
  end
end
