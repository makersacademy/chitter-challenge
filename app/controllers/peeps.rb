class Chitter < Sinatra::Base

  post '/peeps/post' do
    @peep = Peep.create(message: params[:peep],
                        time: Time.now,
                        maker_id: current_maker.id)
    p @peep.maker.user_name
    p @peep.time
    Peep.all.each { |peep| p peep.message }
    redirect('/peeps')
  end

  get '/peeps' do
    erb(:index)
  end


end
