class ChitterApp < Sinatra::Base

  get '/user/new' do
    flash[:notice] = nil
    flash[:errors] = nil
    @user = User.new
    erb :new_user
  end

  post '/user/new' do
    @user = User.create(:email => params[:email],
              :user_name => params[:user_name],
              :name => params[:name],
              :password => params[:password],
              :password_confirmation => params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :new_user
    end
  end

  post '/user' do

  end

end