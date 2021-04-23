require './config/environment'
require './app/models/peep'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    Peep.new('user', 'test')
    @peeps = Peep.all
    erb :index
  end
end