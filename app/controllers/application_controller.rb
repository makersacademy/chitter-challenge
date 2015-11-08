class Chitter < Sinatra::Base

  set :views, proc { File.join(root, "../views") }
  set :public_folder, proc { File.join(root, "../public") }

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash
  use Rack::MethodOverride

  helpers Helpers

  get '/chitter' do
    erb :index
  end

end