require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
require 'sinatra/partial'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  set :session_secret, 'super secret'
  register Sinatra::Flash
  register Sinatra::Partial

  require_relative './models/send_tag_alert'
  require_relative 'controllers/login'
  require_relative 'controllers/logout'
  require_relative 'controllers/peeping'
  require_relative 'controllers/signup'
  require_relative 'controllers/replying'

  set :partial_template_engine, :erb

  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
