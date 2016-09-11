require 'spec_helper'

feature 'Feature - Peep can be peeped' do
  before do
    sign_up
  end
  scenario 'user cannot peep if not logged in' do
    sign_out
    expect(page).not_to have_button 'Peep'
  end
  scenario 'user logged in and can peep' do
    make_peep
    user = User.first
    expect(user.peeps.size).to eq 1
    expect(user.peeps.map(&:message)).to include('A message')
    peep = Peep.first
    expect(peep.user).to eq user
  end
end

feature 'Feature - Peeps are displayed' do
  before do
    sign_up
  end
  scenario 'all peeps are displayed on homepage if signed in' do
    make_peep
    expect(current_path).to eq '/'
    expect(page).to have_content 'Ral @Ral: A message'
  end
  scenario 'all peeps are displayed on homepage if not signed in' do
    make_peep
    sign_out
    expect(page).to have_content 'Ral @Ral: A message'
  end
  scenario 'peeps show timestamp' do
    make_peep
    time = Peep.first.time_created
    expect(page).to have_content time
  end
  scenario 'peeps are shown in reverse chronological order' do
    make_peep
    make_peep(message: 'A second message')
    expect('A second message').to appear_before('A message')
  end
end
