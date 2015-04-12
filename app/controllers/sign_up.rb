class Chitter

  post '/sign_up' do
    @user = User.new(name: params[:name],
                     username: params[:username],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'sign_up/new'
    end
  end

  get '/sign_up/new' do
    erb :"sign_up/new"
  end

end