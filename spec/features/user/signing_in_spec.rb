# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Signing in' do
  scenario 'successfully redirects to index page' do
    sign_in
    expect(current_path).to eq '/'
  end
  scenario 'user full name is displayed in the navbar' do
    sign_in
    expect(page).to have_content('Giamir Buoncristiani')
  end
  scenario 'a log out link is displayed in the navbar' do
    sign_in
    expect(page).to have_content('Log out')
  end
  scenario 'a Peep! link is displayed in the navbar' do
    sign_in
    expect(page).to have_content('Peep!')
  end
  scenario 'if already signed in redirects to the index page automatically' do
    sign_in
    visit('/sessions/new')
    expect(current_path).to eq '/'
  end
end
