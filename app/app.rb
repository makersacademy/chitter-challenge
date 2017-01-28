require 'sinatra/base'

class ChitterApp < Sinatra::Base

  get '/sign_up' do
    erb :sign_up_form
  end

end
