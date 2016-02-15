class Chitter < Sinatra::Base
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password],
                        password_confirmation: params[:password_confirmation],
                        name: params[:name], username: params[:username])
    if @user.valid?
      session[:user_id] = @user.id
      redirect to '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end
end
