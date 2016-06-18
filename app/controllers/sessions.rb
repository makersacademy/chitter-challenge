class Chitter < Sinatra::Base
  get "/user/login" do
    erb(:"session/new")
  end

  post "/session/new" do
    user = User.authenticate(params[:username], params[:password])

    if user
      session[:user_id] = user.id
      redirect("/")
    else
      redirect("/user/login")
    end
  end

  get "/user/logout" do
    erb(:"session/end")
  end

  delete "/session" do
    session[:user_id] = nil
    flash[:notice] = ["Successfully logged out"]
    redirect("/")
  end
end
