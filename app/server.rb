class Chitter < Sinatra::Base
  before do
    current_user
  end

  register Sinatra::Flash
  use Rack::MethodOverride
  use Rack::Session::Pool
end
