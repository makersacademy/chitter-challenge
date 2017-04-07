class Chitter < Sinatra::Base
  
  get '/peeps' do
    @user = User.first
    erb :'peeps/index'
  end
end
