require_relative 'server'

class App < Sinatra::Base
  set :views, File.expand_path('../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)
  use Rack::MethodOverride
  register Sinatra::Partial
  register Sinatra::Flash
  set :sessions, true
  set :partial_template_engine, :erb
  enable :partial_underscores

  def current_user(id)
    User.first(id: id)
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
