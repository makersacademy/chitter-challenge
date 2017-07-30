class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.create(created_at: Time.now, content: params[:content], user_id: current_user.id)
    current_user.peeps << peep
    current_user.save
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end
end
