class Chitter < Sinatra::Base
  get "/user/new" do
    erb(:"user/new")
  end

  post "/user" do
    user = User.create(
      username: params[:username],
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirm: params[:password_confirm]
    )
    user.save
    session[:user_id] = user.id
    redirect to("/")
  end
end
