require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './database_connection_setup'
require 'uri'
require './lib/peep'
=begin
require './lib/reply'
require './lib/tags'
require './lib/peep_tag'
=end 

class Chitter < Sinatra::Base 
  configure :development do 
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  #enable :method_override, :sessions
  use Rack::MethodOverride


  get '/' do 
    'Chitter'
  end

  get '/home' do 
    @peeps = Peep.all
    erb:'/chitter/index'
  end

  post '/home/add' do 
    Peep.add(contents: params[:peep])
    redirect '/home'
  end 

  delete '/home/delete/:id' do 
    Peep.delete(id: params['id'])
    redirect '/home'
  end 

  run! if app_file == $0

end
