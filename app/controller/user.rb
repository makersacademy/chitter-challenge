class Chitter <Sinatra::Base
  
  get '/' do
      redirect('/feed')
  end


  get '/user' do
    @user = User.new
    erb(:'user/new')
  end

  post '/user/signup' do
    @user = User.new(name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirm])
    puts User.all
    if @user.save


      session[:user_id] = @user.id
      redirect('/feed')
    else
      puts @user.errors.full_messages
      flash.now[:errors]=@user.errors.full_messages
      erb(:'user/new') 
    end
  end
end
