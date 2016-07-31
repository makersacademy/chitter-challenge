class Chitter < Sinatra::Base

  get '/signup' do
    @user = User.new
    erb :'signup'
  end

  post '/signup' do
    # We cannot directly access the password attribute, so we use bcrypt
    # and instead deal with the password_digest:
    @user = User.create(username: params[:username],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'signup'
    end
  end
  

end
