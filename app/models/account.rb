class Account < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  
  validates :code, presence: true
  validates :name, presence: true
  validates :credit, presence: true
  validates :debit, presence: true
  validates :description, presence: true

  def debit_precision
    number_with_precision(self.debit, precision: 2)
  end

  def credit_precision
    number_with_precision(self.credit, precision: 2)
  end
end