class Chitter < Sinatra::Base

  get '/signup' do
    @user = User.new
    erb :signup
  end

  post '/create_user' do
    @user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      session[:name] = @user.name
      redirect '/confirmation'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'signup'
    end
  end

  get '/confirmation' do
    erb :confirmation
  end

  post '/signin' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :index
    end
  end

  delete '/' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Hasta luego, ' + session[:name] + '!'
    redirect to '/'
  end

end
