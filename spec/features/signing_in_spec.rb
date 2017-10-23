# def sign_up
#   visit '/users/new'
#   expect(page.status.code).to eq 200
#   fill_in :email, with 'rory@example.com'
#   fill_in :password, with 'Password1'
#   click_button 'Sign up'
# end
#
# feature 'User sign up' do
#   scenario 'I want to sign in as a new User' do
#     expect {sign_up}.to change(User, :count).by(1)
#      
