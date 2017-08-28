require_relative 'setup'

# in app.rb
class App < Sinatra::Base
  enable :sessions
  include AppPage
end

require_all 'routes'
