class Knitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    new_text = params[:text]
    peep = Peep.create(text: new_text, time: Peep.set_time)
    current_user.peeps << peep
    current_user.save
    redirect '/peeps'
  end
end
