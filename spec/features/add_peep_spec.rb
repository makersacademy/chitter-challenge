require_relative '../../app.rb'
require 'pg'
require 'peep'

feature 'Logged in users can add a Peep' do
  scenario 'A logged in user has the option to post a peep' do
    visit '/login'
    fill_in('log_username', with: 'Peeping Sally')
    fill_in('log_password', with: 'helikespeeping')
    click_button('Login')
    expect(page).to have_content "Peep here:"
  end

  scenario 'A peep is added to the peeps' do
    visit '/login'
    fill_in('log_username', with: 'Peeping Sally')
    fill_in('log_password', with: 'helikespeeping')
    click_button('Login')
    fill_in('peep_content', with: "I love glitter")
    click_button('Peep')
    expect(page).to have_content "I love glitter"
  end
end
