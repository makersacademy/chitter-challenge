require 'sinatra'
require 'sinatra/flash'
require 'uri'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/timeline' do
    @peeps = Peep.all
    erb :timeline
  end

  post '/timeline/new' do
    Peep.create(text: params[:text])
    redirect '/timeline'
  end

  run! if app_file == $0
end
