class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def welcome_email
    @order = params[:order]
    mail(to: @order.email, subject: 'Your order has been placed!')
  end
end
