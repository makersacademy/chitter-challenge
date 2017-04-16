class Chitter < Sinatra::Base

  post '/peeps/post' do
    Peep.create(message: params[:peep],
                time: Time.now,
                maker_id: current_maker.id)
    redirect('/peeps')
  end

  get '/peeps' do
    erb(:index)
  end


end
