require './lib/peep.rb'
require './lib/users.rb'
require 'sinatra/base'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions
  get('/') do
    @peeps = Peep.all_peeps
    erb(:index)
  end

  post('/new-peep') do
    Peep.new_peep(user_id: params[:id], peep: params[:peep])
    p params[:peep]
    redirect('/')
  end
end
