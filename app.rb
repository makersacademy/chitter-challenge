require './database_setup.rb'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps, @user = Peep.all, User.all.last
    if @peeps.empty?
      flash.now[:message] = 'No peeps posted yet!'
    end
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
    User.create(
      params[:email], params[:password], params[:name], params[:username]
    )
    redirect '/peeps'
  end

  run! if app_file == $PROGRAM_NAME
end
