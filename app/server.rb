class Chitter < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  set :partial_template_engine, :slim
  enable :partial_underscores

  get '/' do
    slim :index
  end

  # start the server if ruby file executed directly
  # run! if app_file == $0
end
