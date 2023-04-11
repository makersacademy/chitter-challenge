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

  def validate(*args)
    args.each {|form_data| return false if dodgy?(form_data)}
    return true
  end

  def scan_for_tags_in(content)
    tags = content.scan(/@(\w+)/).flatten
    tags.length > 0 ? tags : false
  end

  def create_post(parent_id=nil)
    post = Post.new
    post.user_id, post.content, post.parent_id = @current_user.id, params[:content], parent_id
    post.save
    tagged_usernames = scan_for_tags_in(post.content)
    if tagged_usernames
      users_to_notify = User.where(username: tagged_usernames).all
      users_to_notify.each do |user_to_notify| 
        send_email(user_to_notify.email, user_to_notify.real_name, post.content)
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
