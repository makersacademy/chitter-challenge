class ChitterApp < Sinatra::Base

  post '/peeps' do
    peep = params["peep"]
    Peeps.create(:peep => peep, :entry_time=> Time.now)
    redirect to('/peeps')
  end

  get'/peeps' do
    @peep = Peeps.all(:order => [entry_time.esc])
    erb :peeps
  end

end