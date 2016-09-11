require 'spec_helper'

feature 'Feature - Peep can be peeped' do
  scenario 'user logged in and can peep' do
    sign_up
    user = User.first
    click_button 'Peep'
    expect(current_path).to eq '/peeps/new'
    fill_in :message, with: 'A message'
    click_button 'Peep this'
    expect(user.peeps.size).to eq 1
    expect(user.peeps.map(&:message)).to include('A message')
    peep = Peep.first
    expect(peep.user).to eq user
  end

  scenario 'user cannot peep if not logged in' do
    sign_up
    sign_out
    expect(page).not_to have_button 'Peep'
  end
end
