class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps/new_peep' do
    Peep.create(text: params[:peep], time: Time.now.strftime('%b %d at %R'), maker: current_maker)
    redirect '/peeps'
  end

  get '/peeps/comments/:id' do
    @peep = Peep.get(params[:id])
    erb :'peeps/comments'
  end

  post '/peeps/new_comment/:id' do
    peep = Peep.get(params[:id])
    Comment.create(text: params[:words], time: Time.now.strftime('%b %d at %R'), peep: peep, maker: current_maker)
    redirect "/peeps/comments/#{params[:id]}"
  end

end
