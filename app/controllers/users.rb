class Chitter < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name], username: params[:username],
                    email: params[:email], password: params[:password],
                    password_confirmation: params[:password_confirmation] )
    if @user.save
      redirect '/sessions/new'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end

  end

  patch '/users' do
    redirect '/sessions/new'
  end

  get '/users/recover' do
    erb :'users/recover'
  end

  post '/users/recover' do
    user = User.first(params[:email])
    user.generate_token if user

    erb :'users/acknowledgment'
  end

  get '/users/reset_password' do
    @user = User.find_by_valid_token(params[:token])
    @user ? (erb :'/users/reset_password') : "Your token is invalid"
  end

end
