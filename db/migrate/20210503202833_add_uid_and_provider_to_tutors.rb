class AddUidAndProviderToTutors < ActiveRecord::Migration[6.1]
  def change
    add_column :tutors, :uid, :string
    add_column :tutors, :provider, :string
  end
end
