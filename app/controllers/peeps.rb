class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all.reverse
    @users = User.all
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.create(text: params[:text], time: Time.now)
    current_user.peeps << peep
    current_user.save
    redirect '/peeps'
  end
end
