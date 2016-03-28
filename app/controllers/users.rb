class Chitter < Sinatra::Base

  get '/users/new' do
    
    @user = User.new
    erb :'users/new'
  end

  post '/users/new' do
    @user = User.new( username: params[:username],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:pw_confirm] )

    if @user.save
      session[:user_id] = @user.id
      redirect('/wall')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

end
