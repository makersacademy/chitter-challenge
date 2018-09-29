require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  get '/' do
    @peeps = Peep.all(:order => [:created_at.desc])
    erb :index
  end

  get '/peep' do
    erb :peep
  end

  post '/peeps' do
    Peep.create(message: params[:peep])
    redirect '/'
  end

  run! if app_file == $0
end
