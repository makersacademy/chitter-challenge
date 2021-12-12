# frozen_string_literal: true
require 'sinatra/flash'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'
require_relative './spec/database_connection_setup'

class Chitter < Sinatra::Base
  enable :method_override
  enable :sessions

  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :index
  end

  post '/post_peep' do
    Peep.create(params[:content],'tc1316')
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
