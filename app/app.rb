require 'sinatra/base'
require './lib/peep'
require 'pry'
require 'sinatra/flash'
require 'uri'
require './lib/user'

class Chitter < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, 'key'
    register Sinatra::Flash
  end

  run! if app_file == $0

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :index
  end

  post '/peeps' do
    @peeps = Peep.all.reverse
    @user = User.new(params[:email], params[:password], params[:name], params[:handle])
    erb :index
  end

  post '/peeps/signed_in' do
    @peeps = Peep.all.reverse
    session[:user] = User.new(params[:email], params[:password], params[:name], params[:handle])
    redirect '/peeps/signed_in'
  end

  get '/peeps/signed_in' do
    @peeps = Peep.all.reverse
    @user = session[:user]
    erb :index_signed_in
  end

  post '/peeps/new' do

    if params[:peep_text] == ""
      flash[:error] = "No peep text given"
    else
      Peep.create(Peep.new(params[:peep_text], params[:name], params[:handle]))
    end

    redirect '/peeps/signed_in'
  end

  post '/sign_up' do
    erb :sign_up
  end

end
