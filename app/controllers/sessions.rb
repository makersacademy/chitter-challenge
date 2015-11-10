class Chitter < Sinatra::Base

  get '/sessions/new' do
    redirect('/peeps') unless session[:user_id].nil?
    erb :'sessions/new'
  end

  post '/sessions/new' do
    @user = User.authenticate(params['username'], params['password'])
    if @user
      session[:user_id] = @user.id
      redirect('/peeps')
    else
      save_entered_details
      flash.now[:login_failed] = :failed_authentication
      @login_error = flash[:login_failed]
      erb :'/sessions/new'
    end
  end

  delete '/sessions' do
    @name = current_user.first_name
    session[:user_id] = nil
    erb :'users/logout'
  end

end