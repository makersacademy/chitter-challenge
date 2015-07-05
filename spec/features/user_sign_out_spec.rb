feature 'User signs out' do
  before(:each) do
    User.create(email: 'test@test.com',
                password: 'oranges',
                password_confirmation: 'oranges')
  end

    def sign_in email, password
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    end

    scenario 'while being signed in' do
        sign_in('test@test.com', 'oranges')
        click_button 'Sign in'
        click_button 'Sign out'
        expect(page).to have_content 'Goodbye!'
        expect(page).to_not have_content 'Welcome, test@test.com'
      end

    end