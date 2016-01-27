feature 'User log out' do
  let(:user) do
    User.create(name:                   'Example Name',
                username:               'example',
                email:                  'example@gmail.com',
                password:               'password',
                password_confirmation:  'password')
  end

  scenario 'There is a log out option on home-page' do
    visit '/users/new'
    expect(page).to have_button "Log out or Sign Up"
  end

  scenario 'There is a log out option on messages page' do
    visit '/messages'
    expect(page).to have_button "Log out or Sign Up"
  end

  scenario 'can log out' do
    visit '/users/new'
    click_button 'Log out'
    expect(page).to have_content 'Goodbye'
    expect(page).not_to have_content "Welcome #{user.name}"
  end
end
