require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'

class ChitterChallenge < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all
    @order_message = "List Oldest first"
    @order = true
    @peeps_url = '/peeps/asc'

    erb(:'peeps/index')
  end

  get '/peeps/asc' do
    @peeps = Peep.all_asc
    @order_message = "List Newest first"
    @order = false
    @peeps_url = '/peeps'

    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps' do
    peep = params[:peep_input]
    Peep.create(peep)
    redirect '/peeps'
  end

  get '/users' do
    @users = User.all
    erb(:'users/index')
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    @email = params[:email]
    @password = params[:password]

    User.create(email, password)
    redirect '/users'
  end

end
