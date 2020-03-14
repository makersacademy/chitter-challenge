# frozen_string_literal: true

feature 'adding a new peep' do

  scenario 'A user can add a peep to Chitter' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Jane Doe')
    fill_in('username', with: '@username')
    click_button('Submit')
    
    fill_in('text', with: 'This is a test peep')
    click_button('Submit')

    expect(page).to have_content('This is a test peep')
    expect(page).to have_content('Jane Doe')
  end

end
