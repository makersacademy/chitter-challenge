require 'rubygems'
require 'sinatra/base'
require 'data_mapper'
require './app/data_mapper_setup'

require './app/helpers/current_user'

require './app/controllers/users_controller.rb'

class Chitter < Sinatra::Base
  set :views, Proc.new { File.join("./app/views") }
  enable :sessions

  include CurrentUser

  get '/' do
    @all_cheeps = Cheep.all
    erb :index
  end

  get '/cheeps/new' do
    erb :"cheeps/new"
  end

  post '/cheeps/new' do
    current_user.cheeps.create(content: params[:content])
    redirect to '/'
  end

end
