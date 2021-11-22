require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end
  

  get '/' do
    @peeps = Peep.all.reverse
    erb :index
  end

  get '/peep_form' do
    erb :peep_form
  end

  post '/view_peeps' do
    Peep.create(name: params[:name], username: params[:username], peep: params[:peep])
    
    redirect '/'
  end

  

  run! if app_file == $PROGRAM_NAME
end
