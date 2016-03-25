class Chitter < Sinatra::Base
  get "/" do
    "Hello Chitter!"
  end

  get "/users/new" do
    erb :"/users/new"
  end

  post "/users" do
    user = User.new(name: params[:name],
                     username: params[:username],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect "/users/new"
    end
  end
end
