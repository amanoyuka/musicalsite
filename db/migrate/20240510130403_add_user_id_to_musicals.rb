class AddUserIdToMusicals < ActiveRecord::Migration[6.1]
  def change
    add_column :musicals, :user_id, :integer
  end
end
