class Chitter < Sinatra::Base
#Session methods
  def create_session_data(user)
    %w(id name username email).each { |field|
      create_field(field, user.public_send(field)) }
  end

  def create_field(field, value)
    session[field.to_sym] = value if value
  end

  def create_error_messages(model)
    session[:errors] = model.errors.full_messages
  end

  def current_user
    session[:username]
  end

#User methods
  def create_user(params)
    user = User.create(name: params[:name], username: params[:username],
      email: params[:email], password: params[:password],
      password_confirmation: params[:password_confirmation])
    create_error_messages(user)
    user
  end

  def authenticate_user(params)
    user = User.authenticate(params[:email], params[:password])
    return nil unless user
    create_session_data(user)
    user
  end

#Peep methods
  def create_peep(content)
    Peep.create(content: content, user_id: session[:id])
  end

  def load_peeps(username)
    peeps = Peep.all(user_id: User.first(username: username).id)
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
end
