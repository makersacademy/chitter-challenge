

class Chitter < Sinatra::Base

 use Rack::Flash
 enable :sessions

 get '/' do
 end

  get "/user/new" do
    erb :'user/new'
  end

  post "/user" do
    @user = init_user(params)
    if @user.save
      session[:user_id] = @user.id
      redirect to('/user/index')
    else
    flash[:error] = @user.errors.full_messages
    redirect('/user/new')
    end
  end

  get '/user/index' do
    @users = User.all
    erb :'user/index'
  end

end
