require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require_relative 'chitter_helpers'
require_relative 'database_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  helpers ChitterHelpers

  before do
    get_current_user
  end

  get '/' do
    erb :index
  end

  get '/peeps' do
    get_current_peeps
    if @peeps.empty?
      flash.now[:message] = 'No peeps posted yet!'
    end
    erb :peeps
  end

  post '/peeps/:id/new' do
    redirect '/peeps' if Peep.create(params[:peep], params[:id])
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
    session[:id] = User.all.last.id
    redirect '/peeps'
  end

  post '/peeps/session/destroy' do
    session.clear
    flash.next[:message] = 'You have signed out.'
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
