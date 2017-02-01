class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all.reverse
    @users = User.all
    erb :'peeps/index'
  end

  post '/peeps/new' do
    Peep.create(text: params[:text], time: Time.now, user_id: current_user.id)
    redirect '/peeps'
  end
end
