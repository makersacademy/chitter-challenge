require './database_setup.rb'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    if @peeps.empty?
      flash.now[:message] = 'No peeps posted yet!'
    end
    @username = session[:username]
    erb :peeps
  end

  post '/peeps' do
    redirect '/peeps' if Peep.create(params[:peep])
    flash.next[:warning] = 'Please enter text before peeping!'
    redirect '/peeps'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    session[:username] = params[:username]
    redirect '/peeps'
  end

  run! if app_file == $PROGRAM_NAME
end
