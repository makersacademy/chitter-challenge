require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/messages' do
    redirect('/')
  end

  run! if app_file == $0
end
