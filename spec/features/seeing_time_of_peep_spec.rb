# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

# require 'time'
#
# feature 'Seeing time of peep' do
#
#   before do
#     visit '/users/new'
#     fill_in('email', with: 'peeper@peep.com')
#     fill_in('password', with: '123')
#     fill_in('name', with: 'Peppy Peep')
#     fill_in('username', with: 'Peepqueen')
#     click_button('SIGN UP')
#   end
#
#   scenario 'A user can see the time peep was made' do
#
#     visit('/chitter')
#     fill_in('message', with: 'My first peep')
#     click_button('submit')
#
#     expect(page).to have_content 'My first peep'
#     expect(page).to have_content
#   end
# end
