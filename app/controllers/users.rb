class Chitter < Sinatra::Base

  get '/users/new' do
    @users = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(username: params[:username],
                    name: params[:name],
                    email: params[:email],
                    password: params[:password],
                    confirm_password: params[:confirm_password])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/users/new' #/peeps
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end
end
