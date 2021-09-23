feature 'registration' do
  scenario 'a user can sign up' do
    visit('/users/new')
    fill_in 'name', with: 'Mabon'
    fill_in 'username', with: 'Maby0'
    fill_in 'email', with: 'mabon1@makers.org'
    fill_in 'password', with: 'password123'
    click_button 'Submit'

    expect(page).to have_content 'Welcome, Maby0'
  end
end