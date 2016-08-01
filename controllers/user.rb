class ChitterCore < Sinatra::Base

  get '/' do
    @chits = Chit.all
    @user = User.new
    if current_user
      flash.now[:message] = ["Welcome #{current_user.name}."]
    end
    erb :index
  end

  post '/user' do
    @user = User.create name: params[:name],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:confirm]
    if @user.save
      session[:user_id] = @user.id
      redirect to'/user'
    else
      flash.now[:message] = @user.errors.full_messages
      erb :index
    end
  end

  get '/user' do
    redirect to'/'
  end

end
