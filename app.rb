require 'sinatra/base'
require './lib/peeps'
require 'pg'

class Chitter < Sinatra::Base 
  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :peeps
  end

  run! if app_file == $0

end