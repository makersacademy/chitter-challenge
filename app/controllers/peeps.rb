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
    # require 'pry'; binding.pry;
    peep = Peep.create(text: new_text)
    # peep.users << peep
    peep.save
    redirect '/peeps'
  end
end
