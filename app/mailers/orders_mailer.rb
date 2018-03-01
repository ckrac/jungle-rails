class OrdersMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def confirmation_email(order_id)
    @order = Order.find(order_id)
    mail(to: @order.email, subject: "Order #{@order.id} Confirmation")
  end
end
