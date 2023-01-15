module SessionHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user 
    User.find(session[:user_id]) if session[:user_id]
  end 

  def send_tag_email(name, email, post_content)
    mail = Mail.new do
      from     'me@test.lindsaar.net'
      to       email.to_s
      subject  'You have been tagged in an post!'
      body     "Hello #{name.capitalize}, you have been tagged in a post!\n\n'#{post_content}\n
                \nAll the best from the Chitter Team!"
    end
    mail.delivery_method :logger
    mail.deliver
  end
end
