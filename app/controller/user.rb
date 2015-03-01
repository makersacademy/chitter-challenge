class ChitterApp < Sinatra::Base

  get '/user/new' do
    @user = User.new
    erb :new_user
  end

  post '/user/new' do
    @user = User.create(:email => params[:email],
              :password => params[:password],
              :password_confirmation => params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :new_user
    end
  end

  post '/user' do

  end

end