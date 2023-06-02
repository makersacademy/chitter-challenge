require 'active_record'
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/post'
require_relative 'lib/user'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/post'
    also_reload 'lib/user'
  end

  get '/' do
    p "Printing from app.rb line 16"
    p Post.all_peeps
    @posts = Post.all_peeps
    @posts = @posts.reverse
    return erb(:index)
  end
  post '/' do
    # def invalid_request_parameters?
    #   # Are the params nil?
    #   return true if params[:message] == nil
    
    #   # Are they empty strings?
    #   return true if params[:message]
    
    #   return false
    # end
    # if invalid_request_parameters?
    #   status 400
  
    #   return 'Please enter a message'
    # end
  
    # Parameters are valid,
    # the rest of the route can execute.
    Post.create(time: Time.now, message: params[:message], user_id: 1)
    redirect '/'

  end

end

