class AddTitleRefToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :title, foreign_key: true
  end
end
