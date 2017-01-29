class Chitter < Sinatra::Base

  get '/sessions/new' do
    #@user = User.new
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'/sessions/new'
    end
  end

  get '/sessions/logout' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye, see you again soon!'
    redirect to '/'
  end

  get '/peeps' do
    erb "Peeps"
  end

  get '/users/new' do
    erb(:'/users/new')
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'/users/new')
    end
  end

end
