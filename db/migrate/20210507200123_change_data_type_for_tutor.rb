class ChangeDataTypeForTutor < ActiveRecord::Migration[6.1]
  def change
    change_column :tutors, :years_exp, :string
  end
end
