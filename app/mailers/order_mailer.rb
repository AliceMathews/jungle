class OrderMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_confirmation(order_id, user_email)
    mail(to: email, subject: "Order confirmation - #{order_id}")
  end
end
