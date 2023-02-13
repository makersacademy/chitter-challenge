# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('chitter')

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/' do
    @allpeeps = PeepRepository.new.all
    return erb(:homepage)
  end

  get '/new' do
    return erb(:new_peep)
  end

  post '/newpeep' do
      contents = params[:contents]
      timestamp = Time.now
      user_id = params[:user_id] 
    
      def invalid_request_parameters?
        return true if params[:contents] == nil || params[:contents] == ""
      end
    
      if invalid_request_parameters?
        status 400
        return 'Invalid input'
      end
    
      new_peep = Peep.new
      new_peep.contents = contents
      new_peep.timestamp = Time.now
      new_peep.user_id = user_id
    
      PeepRepository.new.create(new_peep)
    
      return erb(:peep_posted)
    end
  end

  # get '/newuser' do
  #   #this provides the form to add a new user, which is then added through post/newuser
  # end

  # post '/newuser' do
  # end




