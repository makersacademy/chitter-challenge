require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do

  end

  get '/feed' do
    @peeps = Peep.all
    erb :feed
  end

  post '/feed/send_peep' do
    peep = params[:peep_box]
    Peep.create(peep)

    redirect('/feed')
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    name = params[:name]
    username = params[:username]
    email = params[:email]
    password = params[:password]

    User.signup(name, username, email, password)
    flash[:signedup] = 'You have created an account'
    # set flash message to come on feed 'you have signed up'
    redirect '/feed'
  end
end
