# describe 'helper methods' do
#   let(:signup_parameters) { {:username => "John", :password => "password123", :new_signup => "true"} }
#   let(:login_parameters) { {:username => "John", :password => "password123", :login => "true"} }
#   let(:peep_parameters) { {:peep_body => "Hello World", :user_id => "1"} }
#
#   before :each do
#     User.create(username: "John", password: "password123")
#   end
#
#   describe '#logged_in_user' do
#     it 'knows who is logged in' do
#       expect(logged_in_user.username).to eql "John"
#     end
#   end
#
#   describe '#check_user_signup_login_details(params)' do
#     it 'delegates to the process_new_signup or process_new_login methods' do
#     end
#     it 'returns nil if the action is neither a log in nor a sign up' do
#       expect(check_user_signup_login_details({:username => "Tim", :password => "foobarbaz"})).to be nil
#     end
#   end
#
#
#   describe '#process_new_signup(params)' do
#     it 'directs back to the home page if the username is empty' do
#       expect(process_new_signup({:username => "", :password => "password123", :new_signup => "true"})).to eql "/?login=failed"
#     end
#     it 'directs to the feed page if everything is ok' do
#       expect(process_new_signup(signup_parameters)).to eq "/feed"
#     end
#     it 'updates the session user id' do
#       session = {user_id: "1"}
#       expect{process_new_signup(signup_parameters)}.to change{session[:user_id]}
#     end
#   end
#
#
#   describe '#process_new_login(params)' do
#     it 'directs back to the home page if the username is non existent' do
#       expect(process_new_login({:username => "Mr. Snrub", :password => "password123", :login => "true"})).to eql "/?login=failed&user=nil"
#     end
#     it 'directs to the feed page if everything is ok' do
#       User.create(username: "John", password: "password123")
#       expect(process_new_login(login_parameters)).to eq "/feed"
#     end
#     it 'updates the session user id' do
#       User.create(username: "John", password: "password123")
#       session = {user_id: "1"}
#       expect{process_new_login(login_parameters)}.to change{session[:user_id]}
#     end
#   end
#
#
#   describe '#check_password(possible_user, password)' do
#     it 'fails login if the user password does not match' do
#       User.create(username: "John", password: "password123")
#       expect(check_password(User.get(1), "Pa55W0rD321")).to eql "/?login=failed"
#     end
#     it 'directs to the feed page if everything is ok' do
#       User.create(username: "John", password: "password123")
#       expect(check_password(User.get(1), "password123")).to eql "/feed"
#     end
#   end
#
#   describe '#post_peep(params)' do
#     it 'returns a new peep' do
#       expect(post_peep(peep_parameters)).to be_an_instance_of Peep
#     end
#   end
#
# end
