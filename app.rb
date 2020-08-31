require 'sinatra/base'
require './lib/peep'

class  Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/create_peep' do
    erb :create_peep
  end

  post '/new_peep' do
    Peep.create(params[:peep])
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/new_user' do
    User.create(name: params[:name], handle: params[:handle], email: params[:email], password: params[:password])
    redirect '/'
  end


  run if app_file == $0

end
