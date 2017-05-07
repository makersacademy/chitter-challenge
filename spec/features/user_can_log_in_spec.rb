feature 'User can log in with email and password' do

    let!(:user) do
      User.create(name: 'Ana Maria Suciu',
                  username: 'ana',
                  email: 'ana@great.com',
                  password: 'apples')
    end

    scenario 'user logs in with correct info' do
      visit '/sessions/new'
      fill_in :email, with: 'ana@great.com'
      fill_in :password, with: 'apples'
      click_button 'Log In'
      expect(page).to have_content "Welcome to Chitter, #{user.email}"
  end
  scenario 'user logs in with incorrect info' do
    visit '/sessions/new'
    fill_in :email, with: 'ana@great.com'
    fill_in :password, with: '1234'
    click_button 'Log In'
    expect(page).to have_content 'The email or password is incorrect'

  end
end
