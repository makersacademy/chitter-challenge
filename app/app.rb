ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'
require_relative 'controllers/peeps'
require_relative 'controllers/sessions'
require_relative 'controllers/users'

class Chitter < Sinatra::Base
  enable :sessions
  enable :partial_underscores
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb
  set :views, File.dirname(__FILE__) + '/views'
  set :public_folder, File.dirname(__FILE__) + '/public'
  set :public_dir, File.dirname(__FILE__) + '/public'

  get '/' do
    @search = nil
    @peeps = Peep.all(:order => [ :id.desc ])
    erb :index
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def peep_user(users)
      users.each do |user|
        @peep_user = user
      end
    end

    def check_tags(peep)
      peep.split(" ").map{|line| line[0] == "@" ? add_tag(line) : line}.join(" ")
    end

    def add_tag(tag)
      "<a href='/users/#{tag[1..-1]}'>#{tag}</a>"
    end
  end

  run! if app_file == $0
end
