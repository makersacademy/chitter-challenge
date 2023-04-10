require 'mail'
require_relative '../lib/user'
require_relative '../lib/post'

module ApplicationHelpers

  def ask_for_login
    return redirect('/login') unless @current_user
  end

  def dodgy?(input)
    return input.match?(/<|>/) || input.match?(/^\s*$/)
  end

  def validate(parameters, reroute=nil)
    parameters.each {|form_data| return redirect("/#{reroute}") if dodgy?(form_data)}
  end

  def create_post(parent_id=nil)
    post = Post.new
    post.user_id, post.content, post.parent_id = @current_user.id, params[:content], parent_id
    post.save
    scan_and_notify_users_if_tagged(post)
  end

  def scan_and_notify_users_if_tagged(post)
    tags = post.content.scan(/@(\w+)/)
    tags.each do |username_to_notify|
      user_to_notify = User.where(username: username_to_notify).first
      if user_to_notify
        send_email(user_to_notify.email, user_to_notify.real_name, post.content, mail_environment="test")
      end
    end
  end

  def send_email(to_address, real_name, content, mail_environment=nil)
    mail = Mail.new do
      from     ENV["EMAIL_HOST"]
      to       to_address
      subject  'You have been tagged in Chitter'
      body     "#{real_name.capitalize}, you have been tagged in a post in Chitter!\n\n'#{content}'\n"
    end
    mail.delivery_method :logger if mail_environment
    mail.deliver
  end
  
end
