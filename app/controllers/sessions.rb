class Chitter < Sinatra::Base
  get "/sessions/new" do
    erb(:"session/new")
  end

  post "/sessions" do
    user = User.authenticate(params[:username], params[:password])

    if user
      session[:user_id] = user.id
      redirect("/")
    else
      flash.next[:error] = ["Username or password combination incorrect"]
      redirect("/sessions/new")
    end
  end

  delete "/sessions" do
    session[:user_id] = nil
    flash.next[:notice] = ["Successfully logged out"]
    redirect("/")
  end
end
