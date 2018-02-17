require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    "testing testing"
  end
end
