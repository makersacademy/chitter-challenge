require_relative 'web_helper'

feature 'Users can login' do
  scenario 'A user can login to thier profile' do
    sign_up
    visit '/'
    click_on 'Log In'
    fill_in('Username', with: 'The Crimson King')
    fill_in('Password', with: 'ilovemagic')
    click_on 'Log In'

    expect(page).to have_content("Magnus")
    expect(page).to have_content("Magnus@1000sons.co.pr")
  end
end
