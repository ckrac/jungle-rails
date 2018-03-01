class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true
  # after model updates check for id
  after_create :send_confirmation

  private
  def send_confirmation
    OrdersMailer.confirmation_email(self.id).deliver_later
  end
end
