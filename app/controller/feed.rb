class Chitter <Sinatra::Base

  get '/feed' do
    
    erb(:'feed')
  end


end
