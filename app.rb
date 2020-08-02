require 'sinatra'
require 'rack-flash'
require_relative './models/database_start_script'
require_relative './models/peep'
require_relative './models/user'

class ChitterApp < Sinatra::Base
  set :static, true
  enable :sessions, :method_override
  use Rack::Flash

  get '/' do
    erb(:index)
  end

  get '/home' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb(:home)
  end

  get '/home/peep/new' do #convert to peep_id or user_id via params
    p params
    redirect '/home'
  end

  post '/user' do
    user = User.create(name: params[:name], email: params[:email_address], password: params[:password])
    session[:user_id] = user.id
    redirect '/home'
  end

end
