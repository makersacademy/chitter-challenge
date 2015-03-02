require 'rubygems'
require 'sinatra/base'
require 'rack-flash'
require 'sinatra/flash'
require 'data_mapper'
require './app/data_mapper_setup'

require './app/helpers/current_user'
require './app/helpers/date_format'

require './app/controllers/users_controller.rb'
require './app/controllers/cheeps_controller.rb'

class Chitter < Sinatra::Base
  set :views, Proc.new { File.join("./app/views") }
  set :public_folder, Proc.new { File.join("./public") }
  enable :sessions
  use Rack::Flash

  include CurrentUser
  include DateFormat

  get '/' do
    @all_cheeps = Cheep.all.reverse
    erb :index
  end

end
