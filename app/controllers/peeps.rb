class ChitterApp < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end
end
