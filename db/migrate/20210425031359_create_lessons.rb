class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.integer :tutor_id
      t.integer :student_id
      t.string :location
      t.string :address_1
      t.string :address_2
      t.datetime :meeting_time
      t.string :subject
      t.string :topic

      t.timestamps
    end
  end
end
