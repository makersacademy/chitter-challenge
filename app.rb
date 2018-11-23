require 'sinatra'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
enable :sessions
register Sinatra::Flash

  get '/' do
    "Hello, this is my first peep"
  end

  get '/chitter' do
    @peeps = Peep.all_peeps
    erb(:index)
  end

  post '/chitter' do
    Peep.create_peep(content: params[:content])
    redirect('/chitter')
  end

  get '/chitter/users' do
    erb(:newuser)
  end

  post '/chitter/newuser' do
    flash[:notice] =  "You have signed up!" if User.create_user(params[:username], params[:password])
    redirect('/chitter')
  end
    run! if app_file == $0
end
