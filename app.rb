require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'

class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  get '/' do
    erb :index
  end

  post '/add_peep' do
    Peep.create(
      peep_content: params[:peep_content],
      time_posted: params[:time_posted]
      )
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  run! if app_file == $0
end
