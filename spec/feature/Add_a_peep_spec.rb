feature 'New peep' do
  scenario 'Click on the new peep button to add a peep' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Bob Marley', username: 'bmarley')

    visit '/sessions/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')
   

    click_button 'New Peep'

    expect(page).to have_current_path('/peep/new')
  end
end