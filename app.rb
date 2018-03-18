require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require_relative 'lib/peep'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @peeps = Peep.reverse_chron_order_peeps
    erb :index
  end

  post '/add' do
    peep = Peep.add(params[:content])
    flash[:notice] = "It ain't fun if you don't type at least one" unless peep.content.length > 0
    redirect '/'
  end

  run! if app_file == $0
end
