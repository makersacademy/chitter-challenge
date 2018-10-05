require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require './models/setup'
require './models/peep'
require './models/user'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect('/peeps')
  end

  get '/peeps' do
    @user = User.instance
    @peeps = Peep.all_sorted
    erb :index
  end

  post '/peeps' do
    Peep.add(params[:message])
    redirect('/peeps')
  end

  get '/peeps/:id' do
    @peep = Peep.get(params[:id])
    erb :peep
  end

  get '/user/register' do
    erb :register
  end

  get '/user/login' do
    erb :login
  end

  post '/user/login' do
    User.login(params["user"], params["password"])
    flash[:login] = User.instance ? "successful" : "unsuccessful"
    redirect('/')
  end

  post '/user/register' do
    details = { name: params["name"], user: params["user"],
      email: params["email"], password: params["password"] }
    User.add(details)
    User.login(details[:user], details[:password])
    flash[:registration] = User.instance ? "successful" : "unsuccessful"
    redirect('/')
  end

  post '/user/logout' do
    User.logout
    flash[:logout] = true
    redirect('/')
  end

  run! if app_file == $0
end
