require_relative "./user_controller"
require_relative "../helpers/session_helper"
require_relative "../../config/environment"
require "sinatra/base"
require "sinatra/activerecord"
require "bcrypt"
require "mail"

class ApplicationController < Sinatra::Base
  include SessionHelper
  enable :sessions
  register Sinatra::ActiveRecordExtension
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    use UserController
  end
  
  get "/" do
    if current_user
      erb(:redirect_to_user_page)
    else
      @peeps = Peep.order('time DESC')
      @replies = Reply.order('time ASC')
      erb(:index)
    end
  end
end
