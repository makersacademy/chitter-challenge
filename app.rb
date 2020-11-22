require 'sinatra/base'
require './lib/peep'

class ChitterChallenge < Sinatra::Base
  enable :sessions # , :method_override

  get '/' do
    'Welcome to Chitter!'
  end

  get '/peeps' do
    @peeps = Peep.all

    # @peeps.account? to call instance method 'account' on instance of Peep?
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(script: params[:script], created_at: Time.now)

    redirect '/peeps'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
