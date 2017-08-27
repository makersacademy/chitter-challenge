ENV['RACK_ENV'] ||= 'development'

def require_all(dir)
  Dir[File.dirname(__FILE__) + "/#{dir}/*.rb"].each { |file| require file }
end

require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'data_mapper_setup'

# in app.rb
class App < Sinatra::Base
  enable :sessions

  def page(form)
    @form = form
    @messages = session[:messages]
    session[:messages] = []
    erb :index
  end
end

require_all 'routes'
