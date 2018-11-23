require 'sinatra/base'
require_relative './lib/chitter_feed'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @peeps = ChitterFeed.all
    
    erb :chitter_feed
  end

  get '/enter_peep' do
    erb :enter_peep
  end

  post '/new_peep' do
    @user_id = User.find(params[:username])
    peep = Peep.create(user_id: @user_id, content: params[:peep]) if @user_id
    redirect '/'
  end

  run! if app_file == $0
end
