class Chitter

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation],
                     user_name: params[:user_name],
                     user_handle: params[:user_handle]
    if @user.save
      session[:user_id] = @user.id
      p '---' * 10
      p @user.id
      p @user
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

end
