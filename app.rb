require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep.rb'
require_relative './lib/database_connection_setup.rb'
require 'date'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :'chitter/index'
  end

  post '/chitter' do
    @peep = Peep.create(content: params[:content], time_created: Time.now.to_s)
    redirect '/chitter'
  end

    run! if app_file == $0
end