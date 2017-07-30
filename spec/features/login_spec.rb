require 'web_helper'

feature 'Log in to Chitter' do

  scenario 'existing user can log in' do
    sign_up
    log_in
    expect(page).to have_content 'welcome Cat_Peeps93'
    expect(current_path).to eq '/peeps'
    visit '/peeps/new'
    expect(page).to have_content 'Message'
    expect(page).not_to have_content 'Sign in to peep!'
  end

  scenario 'unless logged in, user cannot peep' do
    visit '/peeps/new'
    expect(page).not_to have_content 'Message'
    expect(page).to have_content 'Sign in to peep!'
  end

end
