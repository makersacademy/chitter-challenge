

def current_user
  @current_user ||= User.get(id)
end

def init_user(form_data)
  User.new(email: params[:email],
  name: params[:name], username: params[:username],
  password: params[:password],
  password_confirmation: params[:password_confirmation])
end
