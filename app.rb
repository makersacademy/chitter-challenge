require 'sinatra/base'
require_relative './lib/peep'

class ChitterManager < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peep.view_all_peeps
    erb :home
  end

  get '/add_new_peep' do
    "Hello World"
    erb :add_new_peep
  end

  post '/save_peep' do
    Peep.create_new_peep(content: params[:peep])
    redirect '/'
  end

  run! if app_file == $0

end
