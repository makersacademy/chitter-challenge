class Chitter < Sinatra::Base
  def load_peeps
    peeps = Peep.all(user_id: session[:user_id])
    session[:peeps] = peeps.all.reverse.map { |peep|
      peep_for_printing(peep) }
  end

  def peep_for_printing(peep)
    pretty_peep = peep.content
    parsed = peep.created_at.to_s.scan(/([^T]*)T(.{5})/)
    # ------ ^^ DataMapper DateTime format to [[YYY-MM-DD, HH:MM]] 
    [pretty_peep, parsed[0][0], parsed[0][1]]
    # ^^ Returns a peep array with [content, date, time]
  end

  def create_session_data(user)
    session[:user_id] = user.id if user.id
    session[:name] = user.name if user.name
    session[:username] = user.username if user.username
    session[:email] = user.email if user.email
  end

  def create_user(params)
    user = User.create(name: params[:name], username: params[:username],
      email: params[:email], password: params[:password],
      password_confirmation: params[:password_confirmation])
    create_error_messages(user)
    user
  end

  def create_error_messages(model)
    session[:errors] = model.errors.full_messages
  end

  def current_user
    session[:username]
  end

  def authenticate_user(params)
    user = User.authenticate(params[:email], params[:password])
    return nil unless user
    create_session_data(user)
    user
  end

  def create_peep(content)
    Peep.create(content: content, user_id: session[:user_id])
  end
end
