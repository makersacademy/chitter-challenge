feature 'registration' do
  scenario 'new user' do
    visit '/users/new'
    fill_in('email', with: 'peep4peep@chitter.co.uk')
    fill_in('password', with: 'peepispeepbackwards')
    click_button('Submit')

    expect(page).to have_content "Welcome, peep4peep@chitter.co.uk"
  end
end