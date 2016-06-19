
feature 'user can sign up to a new account' do

  scenario 'on the homepage, user clicks sign-up as a new user' do
    visit('/')
    click_link('Sign up here')
    expect(page).to have_content('Thank you for joining Chitter! Please enter your information below')
  end



  scenario 'signing up creates a new user' do
    visit('/')
    expect { sign_up }.to change(User, :count)
  end

   scenario 'a new user is created when sign-up fields are completed correctly' do
    visit('/')
    sign_up
    expect(page).to have_content "Welcome to Chitter, #{ @current_user }"
  end

end

  def sign_up
    click_link 'Sign up here'
    fill_in 'email', with: 'timchipperfield@gmail.com'
    fill_in 'password', with: '12345'
    fill_in 'name', with: 'Tim'
    fill_in 'username', with: 'timchipperfield'
    click_button 'Sign up'
  end
