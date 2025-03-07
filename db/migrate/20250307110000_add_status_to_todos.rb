class AddStatusToTodos < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :status, :integer, default: 0, null: false
  end
end
