require_relative './web_helpers.rb'

describe 'logging out', type: :feature do
  scenario 'a logged in user logs out' do
    register
    click_button 'log out'
    expect(page).to have_content 'You have successfully logged out'
  end

  scenario 'a visitor views messages page' do
    register
    click_button 'log out'
    expect(page).not_to have_button('log out')
  end
end
