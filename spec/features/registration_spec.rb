feature 'sign up' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in(email, with: 'clare.pinder@live.co.uk')
    fill_in(password, with: 'password123')
    expect(page).to have_content 'Welcome clare.pinder@live.co.uk'
  end
end
