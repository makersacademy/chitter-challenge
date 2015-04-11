class Chitter < Sinatra::Base
  post '/cheeps/applaud' do
    cheepid = params[:cheepid]
    cheep = Cheep.first(id: cheepid)
    cheep.update(applause: cheep.applause + 1)
    redirect '/'
    # request.fullpath
  end
end