class OrderMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_confirmation()
    @email = params[:user_email]
    @order_id = params[:order_id]
    mail(to: @email, subject: "Order confirmation - #{@order_id}")
  end
end
