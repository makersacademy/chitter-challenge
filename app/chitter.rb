require 'sinatra/base'
require 'sinatra/flash'
require_relative './data_mapper_setup'
require 'byebug'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'
end

Dir.glob("#{File.dirname(__FILE__)}/controllers/*.rb").each do |file|
  require file.chomp(File.extname(file))
end

class Chitter

  get '/' do
    erb :index
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end
  end

end
