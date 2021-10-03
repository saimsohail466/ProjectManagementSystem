class Payment < ApplicationRecord
  belongs_to :project
  has_many :comments, as: :commentable

  validates :amount, :title, :description, :payment_type, presence: true
  validate :check_amount_value

  enum payment_type: [:card, :cash]

  private

  def check_amount_value
    if self.amount <= 0.0
      errors.add(:amount, "should be positive..")
    end
  end
end
