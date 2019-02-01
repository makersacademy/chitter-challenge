require 'sinatra/base'
require_relative 'peeps'

class Chitter < Sinatra::Base

enable :sessions

  get '/' do
    erb :index
  end

  get '/peeps' do
    erb :peeps
  end

run! if app_file == $0

end
