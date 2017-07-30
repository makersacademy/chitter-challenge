class Chitter < Sinatra::Base
  get "/users/new" do
    erb :'/users/new'
  end

  post "/users" do
    user = User.new(username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect to("/peeps")
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/new'
    end
  end
end
