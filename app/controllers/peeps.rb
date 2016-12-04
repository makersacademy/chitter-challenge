class Chitter < Sinatra::Base

  get '/peeps' do
    erb :'/peeps/peeps'
  end

end
