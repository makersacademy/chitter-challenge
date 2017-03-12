require 'spec_helper'

feature 'posting peeps/messages' do

  let!(:user) do
    User.create(name: 'Santa', username: 'santaclaus',
                email: 'santa@northpole.com',
                password: 'christmas', password_confirmation: 'christmas')
  end

  before do
    sign_in('santaclaus','christmas')
  end

  scenario 'user can post a peep' do
    add_peep('Counting down until Christmas!')
    expect(user.peeps.map(&:message)).to include('Counting down until Christmas!')
    within 'ul#messages' do
      expect(page).to have_content 'Counting down until Christmas!'
    end
  end

  scenario 'user cannot post peep unless signed in' do
    click_button 'Sign out'
    expect(page).to_not have_field 'message'
    expect(page).to_not have_field 'Peep!'
  end

end
