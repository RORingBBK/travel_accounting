class AddCategoryFieldToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :category, :string
  end
end
