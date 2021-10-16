require "sinatra/base"
require "sinatra/reloader"
require 'sinatra/flash'
require 'uri'
require_relative "./lib/peep"
require_relative "./lib/database_connection"
require "./lib/database_connection_setup"

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/home'
  end

  get '/home' do
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    Peep.create(content: params[:content])
    redirect '/home'
  end
end