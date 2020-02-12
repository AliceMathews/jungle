class OrderMailerPreview < ActionMailer::Preview
  def order_confirmation
    # UserMailer.with(user: User.first).welcome_email
    OrderMailer.with(user_email: @order.email, order_id: @order.id).order_confirmation
  end
end
