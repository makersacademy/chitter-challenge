class Chitter < Sinatra::Base

  get '/register' do
    @user = User.new
    erb :'register/index'
  end

  post '/register' do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
      if @user.save
        session[:user_id] = @user.id
        redirect '/peeps'
      else
        flash.now[:errors] = @user.errors.full_messages
        erb :'register/index'
      end
  end

end
