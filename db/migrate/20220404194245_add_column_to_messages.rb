class AddColumnToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :subject, :string
  end
end
