require 'sinatra/base'
require './lib/users'
require './lib/messages'
# require './lib/security'


class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/peep' do
    # @peep = session[:peep]
    @peep = Users.all
    erb(:peep)
  end

  post '/peep/new' do
    # session[:peep] = params[:enter_chitter]
    Messages.add(params[:enter_chitter])
    redirect '/peep'
  end



end
