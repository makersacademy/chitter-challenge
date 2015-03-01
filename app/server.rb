require 'rubygems'
require 'sinatra/base'
require 'data_mapper'
require './app/data_mapper_setup'

require './app/helpers/current_user'
require './app/helpers/date_format'

require './app/controllers/users_controller.rb'

class Chitter < Sinatra::Base
  set :views, Proc.new { File.join("./app/views") }
  enable :sessions

  include CurrentUser
  include DateFormat

  get '/' do
    @all_cheeps = Cheep.all.reverse
    erb :index
  end

  get '/cheeps/new' do
    if current_user
      erb :"cheeps/new"
    else
      redirect to '/users/sign_in'
    end
  end

  post '/cheeps/new' do
    current_user.cheeps.create(content: params[:content])
    redirect to '/'
  end

end
