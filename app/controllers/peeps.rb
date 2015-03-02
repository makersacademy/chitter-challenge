post '/peeps' do
  puts "post peeps"
  message = params[:message]
  Peep.create(:message => message,
              :maker_id => session[:maker_id])
  redirect to ('/')
end
