require 'sinatra/base'
require 'sinatra/flash'
require './lib/database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect ('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps/new' do
    redirect '/peeps' if Peep.create(params[:text], params[:author])
    if params[:text].chars.length > 240 then
      flash[:notice] = "Your peep is too long. The max limit is 240 characters."
    else
      flash[:notice] = "Please enter your name."
    end
    redirect '/peeps/new'
  end

  get '/users/new' do
    erb(:'users/new')
  end

end
