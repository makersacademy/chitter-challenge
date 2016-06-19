require_relative 'helpers'

class Chitter < Sinatra::Base
  register Sinatra::Partial
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  set :partial_template_engine, :erb
  enable :partial_underscores

  helpers Helpers

  before do
    @current_user ||= get_user_by_id(session[:user_id])
  end
end
