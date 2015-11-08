class Chitter < Sinatra::Base

  get '/sessions/new' do
    redirect('/main/peeps') if not session[:user_id].nil?
    erb :'sessions/new'
  end

  post '/sessions/new' do
    @user = User.authenticate(params['username'], params['password'])
      if @user
        session[:user_id] = @user.id
        redirect('/main/peeps')
      else
        save_entered_details
        flash.now[:login_failed] = :failed_authentication
        @login_error = flash[:login_failed]
        erb :'/sessions/new'
      end
  end

end