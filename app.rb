require 'sinatra/base'
require_relative './models/peep'

class ChitterApp < Sinatra::Base 

  enable :sessions

  get '/' do
    @peeps = Peep.list_ordered_peeps
    p @peeps
    erb :index
  end

  post '/create-peep' do
    Peep.create(message: params[:message], creator: params[:username])
    redirect to '/'
  end

  run! if app_file == $0
end
