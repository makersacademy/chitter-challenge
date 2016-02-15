feature 'can only peep when signed in' do
  scenario 'users have to sign_in/up if they want to peep' do
    visit('/new-peep')
    expect(page).not_to have_content('Write a new peep!')
    expect(page).to have_content('Please sign up or sign in to peep!')
  end
end
