require 'sinatra/base'
require 'sinatra/reloader'
require_relative '../lib/peep'

class Chitter < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @peeps = Peep.all
    erb :post_peep
  end

  post '/' do
    Peep.create(params[:peep_message])
    redirect '/'
  end

  run! if app_file == $0
end