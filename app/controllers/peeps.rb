class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.create(content: params[:content],
                       created_at: Time.now)
    redirect to('/peeps')
  end

end
