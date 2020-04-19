require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'json'
require 'sinatra/flash'
require_relative './helpers/formatting'
require_relative './helpers/errors'
require_relative './models/user'
require_relative './models/peep'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'chitter_development')

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  enable :sessions, :method_override
  helpers Sinatra::Formatting
  helpers Sinatra::Errors

  before do
    @current_user = (User.find_by id: session[:user_id])
  end

  get '/' do
    erb :index
  end
  
end

require_relative "controllers/peeps_controller.rb"
require_relative "controllers/users_controller.rb"
