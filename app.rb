require 'sinatra/base'
require './lib/user'
require './lib/peep'
require './config/data_mapper'
require 'pry'

class Chitter < Sinatra::Base
  ENV['RACK_ENV'] ||= 'development'

  enable :sessions
  enable :method_override

  get '/' do
    @peep = Peep.all
    erb :index
  end

  post '/peep' do
    @peep = Peep.create(content: params[:peep])
    redirect '/'
  end

  run! if app_file == $0
end
