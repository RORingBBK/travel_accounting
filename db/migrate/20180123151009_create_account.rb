class CreateAccount < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :code
      t.string :name
      t.text :description
      t.decimal :debit
      t.decimal :credit

      t.timestamps
    end
  end
end
