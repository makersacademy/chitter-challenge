require 'sinatra'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get('/') do
    @peep = Peep.list
    erb :index
  end

  get('/register') do
    erb :register
  end

  get('/post') do
    "Post your peep here"
  end

  run! if app_file == $PROGRAM_NAME

end
