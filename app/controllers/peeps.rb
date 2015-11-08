class ChitterApp < Sinatra::Base

  get '/peeps' do
    erb :'peeps/index'
  end

end
