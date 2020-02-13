class OrderMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_confirmation(email, order_id)
    @email = email
    @order_id = order_id
    mail(to: @email, subject: "Order confirmation - #{@order_id}")
  end
end
