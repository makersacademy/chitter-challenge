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
      save_and_open_page
  end
end
