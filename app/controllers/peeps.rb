class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all.reverse
    @users = User.all
    erb :'peeps/index'
  end

  post '/peeps/new' do
    current_user.peeps << Peep.create(text: params[:text], time: Time.now, user_id: current_user.id)
    current_user.save
    redirect '/peeps'
  end
end
