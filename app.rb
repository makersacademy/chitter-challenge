require 'sinatra/base'
require './database_connection_setup'
current_dir = Dir.pwd
Dir["#{current_dir}/lib/*.rb"].each { |file| require file }

class Chitter < Sinatra::Base

  get '/' do
    @posts = Posts.all
    erb :index
  end

end
