feature 'user cannot add a peep if they are not signed in' do
  scenario 'link is not available if user is not signed in' do
    visit('/')
    expect(page).not_to have_link('New Peep')
    expect(page).to have_link('sign up for Chitter', href: '/users/new')
  end
end
feature 'user can add peep after signing in' do
  scenario 'user has signed in' do
    sign_in_to_chitter
    visit('/')
    click_link('New Peep')
    fill_in 'content', with: 'Check out my law blog!'
    click_button('Submit')
    expect(page).to have_content('Check out my law blog!')
    expect(page).to have_content('by bloblaw')
  end
end
