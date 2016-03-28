class Chitter < Sinatra::Base

  get '/peeps' do
    erb(:peeps)
  end

end
