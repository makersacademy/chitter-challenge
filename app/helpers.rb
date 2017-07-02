

def current_user
  @current_user ||= User.get(id)
end

def create_user(form_data)
  User.create(email: params[:email],
  name: params[:name], username: params[:username],
  password: params[:password],
  password_confirmation: params[:password_confirmation])
end
