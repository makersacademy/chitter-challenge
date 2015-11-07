class Chitter < Sinatra::Base
  get '/peeps/index' do
    @username = current_user ? current_user.username : nil
    erb(:'/peeps/index')
  end
end

