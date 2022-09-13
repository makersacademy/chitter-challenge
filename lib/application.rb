require 'sinatra/base'

class Application < Sinatra::Base

  get '/' do
    peeps = Peeps.all
    return peeps[0].content
  end

end 