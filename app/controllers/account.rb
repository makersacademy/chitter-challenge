class Chitter < Sinatra::Base
  get '/login' do
    erb :log_in
  end

  post '/login' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :log_in
    end
  end

  delete '/logout' do
    session[:user_id] = nil
    flash.next[:notice] = 'Goodbye!'
    redirect to '/'
  end

  get '/signup' do
    @user = User.new
    erb :sign_up
  end

  post '/signup' do
    @user = User.new(name: params[:name], username: params[:username],
                     email: params[:email], password: params[:password],
                     password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:alert] = @user.errors.full_messages
      erb :sign_up
    end
  end
end
