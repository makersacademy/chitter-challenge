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
      flash.next[:error] = ["Username or password combination incorrect"]
      redirect("/user/login")
    end
  end

  delete "/session" do
    session[:user_id] = nil
    flash.next[:notice] = ["Successfully logged out"]
    redirect("/")
  end
end
