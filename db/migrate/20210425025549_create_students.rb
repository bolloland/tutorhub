class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :grade
      t.string :subject_help
      t.text :student_bio

      t.timestamps
    end
  end
end
