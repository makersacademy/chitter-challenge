feature 'Posting Peeps' do
  scenario 'only a sign in user can post a new peep' do
    sign_up
    expect(page).to have_content 'Peep Now'
    expect(page).not_to have_content 'Want to Peep? Sign in or Sign up'
  end

  scenario 'users who are not signed in cannot peep' do
    sign_up
    click_button 'Sign out'
    expect(page).to_not have_content 'Peep Now'
    expect(page).to have_content 'Want to Peep? Sign in or Sign up'
  end
end
