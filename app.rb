require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class ChitterManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :peep
  end

  post '/peep_add' do
    @peeps = [
      'Hi, I\'m peep one',
      'Hi, I\'m peep two',
      'Hi, I\'m peep three',
    ]
    @peeps.push(params[:peep])
    erb :peep_list
  end

  run! if app_file == $0
end
