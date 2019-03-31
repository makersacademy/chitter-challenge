require 'user_signin_create_helper'

feature 'welcome message' do
  scenario 'user visits home page' do
    visit('/chitter')
    expect(page).to have_content('Welcome to Chitter')
  end
end

feature 'add new peep' do
  scenario 'user cannot peep when not signed in' do
    visit('/chitter')
    expect(page).not_to have_button('New peep')
  end

  scenario 'user can post new peep to Chitter when signed in' do
    create_user
    visit('/chitter')
    sign_in
    click_button('New peep')
    fill_in('peep_content', with: 'I am eating lunch')
    click_button('Post')
    expect(page).to have_content('I am eating lunch')
  end
end
