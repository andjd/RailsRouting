class CreateUserIdIndex < ActiveRecord::Migration
  def change
    add_index :contacts, :user_id
  end
end