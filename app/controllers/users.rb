

class Chitter < Sinatra::Base

 use Rack::Flash
 enable :sessions

 get '/' do
 end

  get "/user/new" do
    erb :'user/new'
  end

  post "/user" do
    new_user = create_user(params)
    redirect('/user/index') unless new_user.id.nil?
    flash[:error] = "Your input was invalid, try again."
    redirect('/user/new')
  end

  get '/user/index' do
    @users = User.all
    erb :'user/index'
  end

end
