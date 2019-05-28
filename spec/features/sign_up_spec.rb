# require 'pg'

# feature 'sign up' do

#   scenario 'checks that user can sign up to chitter' do

#     visit '/'

#     click_button 'Sign Up'

#     fill_in 'email', with: 'carlton@carlton.com'
#     fill_in 'password', with: 'carlton123'
#     fill_in 'name', with: 'carlton'
#     fill_in 'username', with: 'carlton7'

#     click_button 'Submit'

#     con = PG.connect :dbname => 'chitter_test'
#     chitter_feed = con.exec "SELECT * FROM users;"
#     chitter_feed.map do |feed|
#       feed[1]
#     end
#     p chitter_feed
#     expect(chitter_feed).to eq 'carlton@carlton.com'
   
#   end
  
# end