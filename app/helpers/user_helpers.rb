class Chitter < Sinatra::Base
  def create_user(params)
    user = User.create(name: params[:name], username: params[:username],
      email: params[:email], password: params[:password],
      password_confirmation: params[:password_confirmation])
    create_tag(user)
    create_error_messages(user)
    user
  end

  def authenticate_user(params)
    user = User.authenticate(params[:email], params[:password])
    return nil unless user
    create_session_data(user)
    user
  end

  def check_for_mentions(tag_name)
    user_id = Tag.first(tag_name: tag_name).user_id
    return nil unless user_id
    email_user(user_id)
  end

  def email_user(id)
    TagBossMan.call(User.first(id: id), Peep.last, User.first(id: session[:id]))
  end
end
