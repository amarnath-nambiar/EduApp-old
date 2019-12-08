class CreateStudentInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :student_interests do |t|
      t.references :student, foreign_key: true
      t.references :interest, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
