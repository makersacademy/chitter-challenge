require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions
  #register Sinatra::Flash

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  # post '/peeps' do
  #   session[:peep] = params[:peep]
  #   redirect '/peepsfeed'
  # end
  #
  # get '/peepsfeed' do
  #   @peep = session[:peep]
  #   erb :peepsfeed
  # end

   run! if app_file == $0
end
