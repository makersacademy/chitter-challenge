class Chitter < Sinatra::Base

  helpers do

    def sign_in_error_type
      if @user.nil? && User.first(user_name: params[:existing_user_name])
        'Access Denied Impersonator'
      else
        'Brother, is that really you?'
      end
    end
  end


  post '/sign_in' do
    @user =
      User.authenticate(params[:existing_user_name], params[:existing_password])
    if @user
      session[:user_id] = @user.id
      redirect '/welcome'
    else
      flash.now[:authentication_error] = sign_in_error_type
      erb :'user/index'
    end
  end


  get '/welcome' do
    @user = session_user.user_name
    erb :'user/welcome'
  end
end
