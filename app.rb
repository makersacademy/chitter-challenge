require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

    get'/' do
      "This is my new message"
    end
end