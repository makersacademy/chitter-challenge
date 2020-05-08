require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/peeps' do
  @peeps =[  'Good morning!',
    'This is a peep!' ]
    erb(:index)
  end

end
