ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/peep'
require_relative'data_mapper_setup'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

 get '/' do
   "Welcome to Chitter"
 end

 get '/peeps' do
   @peeps = Peep.all
   erb :'peeps/index'
 end

 get '/peeps/new' do
   erb :'peeps/new'
 end

 post '/peeps' do
   time = Time.now
   Peep.create(text: params[:text], time: time)
   redirect '/peeps'
 end

 run! if app_file == $0
end
