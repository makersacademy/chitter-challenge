class Chitter < Sinatra::Base
  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email_address: 		params[:email_address],
                     password:	 	params[:password],
                     password_confirmation: 	params[:password_confirmation],
                     user_name:	 	params[:user_name],
                     real_name:	 	params[:real_name])
    if @user.save
      session[:user_id] = @user.id
      redirect '/chitter-newsfeed'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end
end
