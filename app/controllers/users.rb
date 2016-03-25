class Chitter < Sinatra::Base
  get "/" do
    erb :index
  end

  get "/users/new" do
    @user = User.new
    erb :"users/new"
  end

  post "/users/new" do
    @user = User.new(name: params[:name],
                     username: params[:username],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect "/"
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :"users/new"
    end
  end
end
