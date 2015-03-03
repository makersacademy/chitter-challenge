post '/peeps' do
  message = params[:message]
  Peep.create(:message => message,
              :time => Time.now,
              :maker_id => session[:maker_id])
  redirect to ('/')
end
