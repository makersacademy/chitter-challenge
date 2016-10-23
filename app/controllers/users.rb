class Chitter < Sinatra::Base
  get '/' do
    redirect '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb(:'users/new')
  end

  post '/users' do
    @user = User.create(name:     params[:name],
                        username: params[:username],
                        email:    params[:email],
                        password: params[:password]
                        )
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'users/new')
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
