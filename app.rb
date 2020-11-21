require 'sinatra/base'
require './lib/peep'

class ChitterChallenge < Sinatra::Base
  enable :sessions # , :method_override

  get '/' do
    'Welcome to Chitter!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
