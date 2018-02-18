require 'sinatra/base'
require 'sinatra/flash'
require './lib/cheeter'
require './lib/user'
require './database_connection_setup'

class Cheeter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :sign_in
  end

  post '/add_peep' do
    begin
      @sig_in = User.sign_in(params[:name], params[:password])
      redirect '/'
    rescue Exception => error
      flash[:notice] = error.message
    end
      erb :peep
  end

  post '/first_peep' do
    @peep = params[:peep]
    @add_post = Peep.add_peep(params[:peep])
    erb :add_post
  end

  get '/view_history' do
    erb :view_history
  end

  get '/chronologic_order' do
    @peeps = Peep.all
    erb :chronologic_order
  end


end
