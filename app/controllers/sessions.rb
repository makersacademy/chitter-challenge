class Chitter < Sinatra::Base
  get "/sessions/new" do
    erb :"sessions/new"
  end

  post "/sessions" do
    user = Login.new(User).user(params[:email], params[:password])
    session[:user_id] = user.id if user
    redirect "/"
  end

  delete "/sessions" do
    session.delete(:user_id)
    redirect "/"
  end
end
