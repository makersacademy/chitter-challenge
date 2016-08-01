class ChitterCore < Sinatra::Base

  post '/chits/new' do
    Chit.create(message: params[:chit], chitee: current_user.name, date: TimeString.date, time: TimeString.time)
    redirect to'/'
  end

end
