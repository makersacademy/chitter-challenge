ENV['RACK_ENV'] = 'development'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'sinatra/bootstrap'
require './app/data_mapper_setup'
require './app/controllers/users.rb'
require './app/controllers/peeps.rb'
require './app/views/view_helpers.rb'

class Chitter < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/views'
  set :public_folder, File.dirname(__FILE__) + '/public'
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  register Sinatra::Partial
  register Sinatra::Bootstrap::Assets

  set :partial_template_engine, :erb
  enable :partial_underscores

  get '/' do
    erb :root_page
  end

  helpers Helpers
end
