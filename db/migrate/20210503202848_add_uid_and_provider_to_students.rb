class AddUidAndProviderToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :uid, :string
    add_column :students, :provider, :string
  end
end
