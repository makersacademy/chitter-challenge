post '/peeps' do
  message = params[:message]
  Peep.create(:message => message,
              :time => Time.now,
              :maker_id => session[:maker_id])
  redirect to ('/')
end

# t.strftime("Peeped on %m/%d/%Y")   #=> "Peeped on 11/19/2007"
# t.strftime("at %I:%M%p")            #=> "at 08:37AM"