require 'sinatra/base'
require 'data_mapper'
require 'bcrypt'
require 'sinatra/partial'
require 'rack-flash'
require_relative 'lib/user'
require_relative 'lib/message'

require_relative 'data_mapper_setup'
require_relative 'helpers/application'

class Chitter < Sinatra::Base

  include Helpers

  configure do
    register Sinatra::Partial
    set :partial_template_engine, :erb
  end

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride

  get '/' do
    @messages = Message.all
    erb :homepage
  end

  post '/messages' do
    text = params['text']
    author = User.first(id: session[:user_id]).email
    Message.create(text: text, author: author, time_stamp: Time.now)
    redirect to('/')
  end

end

require_relative 'controllers/users'
require_relative 'controllers/sessions'