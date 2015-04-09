require 'sinatra'

class Chitter < Sinatra::Application

  get '/' do
    "<input type='text' name='email'> welcome tansaku"
  end

end
