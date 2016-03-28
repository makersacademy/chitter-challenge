class Chitter < Sinatra::Base

  get '/users/new' do
     @user = User.new
     erb :'/users/new'
  end


  post '/signup' do
    @user = User.new(name: params[:name], email: params[:email],
                    username: params[:username], password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:notice] = "Passwords do not match or email address was not valid"
      erb :'/users/new'
    end
  end

end