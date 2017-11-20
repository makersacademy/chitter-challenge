class Chitter < Sinatra::Base
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
end
