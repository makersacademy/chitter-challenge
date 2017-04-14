class Chitter <Sinatra::Base

  get '/user/new' do
    @user = User.new
    erb :'/user/new'
  end

  post '/user' do
    @user = User.new(username: params[:username],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps/index')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/user/new'
    end
  end

end
