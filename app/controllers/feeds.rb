class Chitter < Sinatra::Base

  get '/feeds/view' do
    erb :'/feeds/view'
  end

end
