class Chitter < Sinatra::Base
  post '/cheeps/applaud' do
    cheepid = params[:cheepid]
    cheep = Cheep.first(id: cheepid)
    cheep.update(applause: cheep.applause + 1)
    redirect '/'
    # request.fullpath
  end
  get '/users/profiles/:profile' do
    @profile = params[:profile]
    @profile = User.first(username: @profile)
    @cheeps = Cheep.all.select do |cheep|
      cheep.user.username == @profile.username
    end
    erb :'users/profile'
  end
end