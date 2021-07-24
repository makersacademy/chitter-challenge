
require 'sinatra/base'
require 'sinatra/reloader'

class ChitterManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :peep
  end

  post '/peep_add' do
    @first_peep = params[:peep]
    erb :peep_list
  end

  run! if app_file == $0
end

