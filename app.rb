require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'

class ChitterApp < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/peeps' do
    # @user = User.new(params[:user_name])
    @peeps = Peep.list
    erb :peeps
  end

  # post '/sign-in' do
  #   User.add(params[:user_name])
  #   redirect '/peeps'
  # end

  post '/post_peep' do
    Peep.post(params[:peep])
    redirect '/peeps'
  end

  run! if app_file == $0
end