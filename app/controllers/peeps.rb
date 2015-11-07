class Chitter < Sinatra::Base
  get '/peeps/index' do
    @username = current_user.username
    erb(:'/peeps/index')
  end
end

