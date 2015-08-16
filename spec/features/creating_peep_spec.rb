# require 'spec_helper'
#
# feature 'Creating Peeps' do
#
#   before(:each) do
#     User.create(email: 'sam@makersacademy.com', password: 'secret1234', first_name: 'Samuel', last_name: 'Joseph', username:'tansaku')
#   end
#
#   scenario 'can post a new peep to Chitter' do
#     sign_in(email: user.email,   password: user.password)
#     # visit '/peeps/new_peep'
#     # fill_in 'text', with: 'peep message'
#     # click_button 'Submit peep'
#     #
#     # expect(current_path).to eq '/peeps'
#     # expect(Peep.count).to eq(1)
#     # within 'ul#peeps' do
#     #   expect(page).to have_content('peep message')
#     # end
#   end
# end

feature 'Creating Peeps' do

  let(:user) do
    User.create(email: 'sam@makersacademy.com', password: 'secret1234', first_name: 'Samuel', last_name: 'Joseph', username:'tansaku')
  end

  scenario 'can post a new peep to Chitter' do
    expect(Peep.count).to eq(0)
    sign_in(email: user.email,   password: user.password)
    visit '/peeps/new_peep'
    fill_in 'text', with: 'peep message'
    click_button 'Submit peep'
    expect(Peep.count).to eq(1)
  end

end
