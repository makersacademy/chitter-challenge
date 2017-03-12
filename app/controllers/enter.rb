class Chitter < Sinatra::Base

  get '/sign_up' do
    erb :sign_up
  end

  get '/log_in' do
    erb :log_in
  end

end
