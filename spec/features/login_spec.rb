feature 'Login' do
  let(:user_details) {[
    { :email => 'bob@testing.com', :user_name => 'bob', :password => 'password' },
  ]}

  before do
    visit '/session/login'
  end

  scenario 'Page loads and form visible' do
    expect(page).to have_content 'Username'
    expect(page).to have_field 'user_name_field'
    expect(page).to have_content 'Password'
    expect(page).to have_field 'password_field'
    expect(page).to have_button 'login_button'
  end

  context 'Login process' do
    before do
      add_test_users_directly(user_details)
    end

    scenario 'Can login' do
      fill_in 'user_name_field', with: user_details[0][:user_name]
      fill_in 'password_field', with: user_details[0][:password]
      click_button 'login_button'
      expect(page).to have_content "Welcome back #{user_details[0][:user_name]}"
    end

    scenario "Can't login when username wrong" do
      fill_in 'user_name_field', with: 'non-user'
      fill_in 'password_field', with: 'password'
      click_button 'login_button'
      expect(page).to have_content "Sorry, the username and/or password was entered incorrectly."
    end

    scenario "Can't login when password wrong" do
      fill_in 'user_name_field', with: user_details[0][:user_name]
      fill_in 'password_field', with: 'wrong password'
      click_button 'login_button'
      expect(page).to have_content "Sorry, the username and/or password was entered incorrectly."
    end
  end
end
