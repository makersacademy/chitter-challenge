require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep_manager'

class ChitterApp < Sinatra::Base
  configure :development do
    # :nocov:
    register Sinatra::Reloader
    # :nocov:
  end

  before do
    @peep_manager = PeepManager.instance
  end

  get '/' do
    @peeps = @peep_manager.all_peeps
    p "Peeps: #{@peeps}"
    erb :index
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps' do
    p "Params: #{params}"
    p "Body: #{params['body']}"
    @peep_manager.add(params['body'])
    redirect '/'
  end

  run! if app_file == $0
end
