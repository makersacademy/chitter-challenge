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

    if user.id
      session[:user_id] = user.id
      redirect("/")
    else
      flash[:error] = user.errors.full_messages
      redirect("/user/new")
    end
  end

  get "/user/profile/:username" do
    @user = User.first(username: params[:username])
    erb(:"user/profile")
  end
end
