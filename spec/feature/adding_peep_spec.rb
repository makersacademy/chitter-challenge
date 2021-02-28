feature 'user cannot add a peep if they are not signed in' do
  scenario 'user tries to visit new peeps page without signing in' do
    visit('/')
    expect(page).not_to have_link('New Peep')
    expect(page).to have_link('Sign up for Chitter', href: '/users/new')
    visit ('/peeps/new')
    expect(page).to have_content('You must be signed in to add peeps to chitter!')
    expect(page).to have_link('Sign up for Chitter', href: '/users/new')
    expect(page).to have_link('Back to peeps', href: '/peeps')
  end
end
