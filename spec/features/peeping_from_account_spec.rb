# require 'helpers/session'
#
# feature 'peeping from account' do
#   let!(:user) do
#     User.create(email: 'nemo@clownfish.com', password: 'dory', name: 'Nemo', username: 'Nemo123')
#   end
#
#   scenario 'peeps are created from user account' do
#     sign_in(email: user.email, password: user.password)
#     visit '/peeps/new'
#     fill_in 'message', with: 'My first peep!'
#     click_button 'Post'
#     peep = Peep.first
#     expect(user.peeps.map(&:message)).to include('My first peep!')
# end
# end
