class ChitterApp < Sinatra::Base

  post '/peeps' do
    peep = params["peep"]
    Peep.create(:peep => peep, :entry_time=> Time.now, :user_id => 1)
    redirect to('/peeps')
  end

  get'/peeps' do
    @peep = Peep.all(:order => [:entry_time.desc])
    erb :peeps
  end

end