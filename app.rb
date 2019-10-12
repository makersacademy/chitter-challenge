require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/time_converter'
require './lib/user'

class Chitter < Sinatra::Base
  enable :method_override, :sessions
  register Sinatra::Flash


  get '/' do
    @page = :index
    erb :template
  end
  
  get '/home' do
    @peeps = Peep.all.reverse
    @css_path = 'main.css'
    @page = :'home/home'
    erb :template
  end

  get '/sign_up' do
    @page = :'users/sign_up'
    erb :template
  end

  post '/peeps' do
    @peep = Peep.create(content: params['peep-content'])
    redirect '/home'
  end

  post '/users' do
    @user = User.create(
      handle: params[:handle],
      name: params[:name],
      passhash: params[:password]
    )
    session[:authed_user] = @user.id
    flash[:new_user] = "Thanks for joining Chitter, #{@user.name}! Have a really chit time!"
    redirect '/home'
  end
end