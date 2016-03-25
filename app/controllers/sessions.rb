class Chitter < Sinatra::Base
  get "/sessions/new" do
    erb :"sessions/new"
  end

  post "/sessions" do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect "/"
    else
      flash.now[:errors] = ["Incorrect email or password"]
      erb :"sessions/new"
    end
  end

  delete "/sessions" do
    session[:user_id] = nil
    flash.keep[:notice] = "Thanks for using Chitter. :)"
    redirect "/"
  end
end
