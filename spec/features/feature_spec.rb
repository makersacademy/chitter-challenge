
describe 'Bookmark Manager' do

  feature 'Index page' do
    scenario 'has index page' do
      visit('/')
      expect(page).to have_content("Chitter")
    end

    scenario 'can set up an account' do
      visit('/sign_up')
      fill_in('name', with: 'Emma')
      fill_in('username', with: 'emmature')
      fill_in('email', with: 'test1@test.com')
      fill_in('password', with: 'password')
      click_button 'Sign-up!'
      expect(page).to have_content("Posts")
    end

    scenario 'can tell you if username is not unique' do
      visit('/sign_up')
      fill_in('name', with: 'Emma')
      fill_in('username', with: 'kks110')
      fill_in('email', with: 'test1@test.com')
      fill_in('password', with: 'password')
      click_button 'Sign-up!'
      expect(page).to have_content("Username already taken")
    end

    scenario 'can tell you if email address is not unique' do
      visit('/sign_up')
      fill_in('name', with: 'Emma')
      fill_in('username', with: 'emmature')
      fill_in('email', with: 'test@test.com')
      fill_in('password', with: 'password')
      click_button 'Sign-up!'
      expect(page).to have_content("Email already taken")
    end

    scenario 'can add a post' do
      visit('/login')
      fill_in('username', with: 'kks110')
      fill_in('password', with: 'test')
      click_button 'Login!'
      fill_in('body', with: 'This is a test comment')
      click_button 'Post'
      expect(page).to have_content('This is a test comment')
    end

  end

  feature 'Login page' do
    scenario 'can log in' do
      visit('/login')
      fill_in('username', with: 'kks110')
      fill_in('password', with: 'test')
      click_button 'Login!'
      expect(page).to have_content("Posts")
    end

    scenario 'can stop you logging in if password is incorrect' do
      visit('/login')
      fill_in('username', with: 'kks110')
      fill_in('password', with: 'asdf')
      click_button 'Login!'
      expect(page).to have_content("Invalid Credentails")
    end
  end



end
