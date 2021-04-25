class CreateTutors < ActiveRecord::Migration[6.1]
  def change
    create_table :tutors do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :years_exp
      t.string :subject_taught
      t.text :tutor_bio

      t.timestamps
    end
  end
end
