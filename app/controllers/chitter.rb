class Chitter < Sinatra::Base
  set :root, File.dirname(File.expand_path("..", __FILE__))
  enable :sessions
  session_secret
  set :session_secret, "here be dragons"
  register Sinatra::Flash

  get "/" do
    redirect "/peeps"
  end

  get "/peeps" do
    @user = User.find(session[:user_id]) unless session[:user_id].nil?
    @peeps = Peep.all.order("created_at desc")
    erb :'peeps/index'
  end

  post "/peeps" do
    Peep.create(content: params["content"], poster_id: session[:user_id])
    redirect "/peeps"
  end

  post "/users" do
    user = User.register(username: params["username"], email: params["email"], full_name: params["full_name"], password: params["password"])
    session[:user_id] = user.id
    flash.next[:notice] = "Welcome, #{params["username"]}"
    redirect "/peeps"
  end

  get "/users/new" do
    erb :'users/new'
  end

  post "/sessions" do
    @user = User.authenticate(username: params[:username], password: params[:password])
    if @user.nil?
      flash.next[:warning] = "Incorrect username/password"
      redirect "/sessions/new"
    else
      session[:user_id] = @user.id
      flash.next[:notice] = "Welcome back, #{params[:username]}"
      redirect "/peeps"
    end
  end

  get "/sessions/new" do
    erb :'sessions/new'
  end

  get "/sessions/destroy" do
    session[:user_id] = nil
    flash[:notice] = "Successfully logged out"
    redirect "/"
  end
end
