class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :'peeps/index'
  end

  post '/peeps/new' do
    peep = Peep.create(text: params[:text], time: Time.now)
    peep.user = current_user
    peep.save
    redirect '/peeps'
  end
end
