require_relative 'helpers'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride
  register Sinatra::Partial
  set :partial_template_engine, :erb
  set :public_folder, Proc.new {File.join(root, 'public')}

  helpers Helpers
  run! if app_file ==  $0
end
