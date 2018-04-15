require 'sinatra.base'

class ChitterApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect ('/sign_up')
  end

end
