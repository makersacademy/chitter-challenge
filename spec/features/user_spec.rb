feature 'testing a user can sign up' do
  scenario 'a user signs up with a username, email and password' do
    visit '/users/new'
    expect(page).to have_css("input[type=text][name='username']")
    expect(page).to have_css("input[type=email][name='email']")
    expect(page).to have_css("input[type=password][name='password']")
  end
end
