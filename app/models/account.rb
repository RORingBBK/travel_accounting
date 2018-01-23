class Account < ApplicationRecord
  validates :code, presence: true
  validates :name, presence: true
  validates :credit, presence: true
  validates :debit, presence: true
  validates :description, presence: true
end