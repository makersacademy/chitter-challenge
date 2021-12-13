feature "Sign in" do
  scenario "a user can sign in with correct email and password" do
    user = User.create(name: "Ruby", username: "rb", email: 'test@ruby.com', password: 'password')

    visit '/users/login'
    fill_in(:email, with: 'test@ruby.com')
    fill_in(:password, with: 'password')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, Ruby'
  end
   
  scenario "a user can not sign in if not already registered or wrong email" do
    visit '/users/login'
    fill_in(:email, with: 'notregistered@email.com')
    fill_in(:password, with: 'password')
    click_button('Sign in')

    expect(page).to have_content 'Wrong Email or password'
    expect(page).to have_current_path('/users/login')
   end

   scenario "a user enter the wrong password" do
    User.create(name: "Ruby", username: "rb", email: 'test@ruby.com', password: 'password')

    visit '/users/login'
    fill_in(:email, with: 'test@ruby.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, Ruby'
    expect(page).to have_content 'Wrong Email or password'
    expect(page).to have_current_path('/users/login')
   end

   scenario 'a user can sign out' do
    User.create(name: "Ruby", username: "rb", email: 'test@ruby.com', password: 'password')

    
    visit '/users/login'
    fill_in(:email, with: 'test@ruby.com')
    fill_in(:password, with: 'password')
    click_button('Sign in')

    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, Ruby'
    expect(page).to have_content 'You have signed out.'
  end

end