require 'sinatra/base'
require './lib/peep'
require './lib/database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    @peeps = Peep.all.sort_by(&:'time').reverse
    erb :index
  end

  post '/messages' do
    Peep.create(peep: params[:message], time: Time.now.strftime("%m/%d/%Y %H:%M:%S"))
    redirect('/')
  end

  run! if app_file == $0
end
