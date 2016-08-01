feature 'Signing up' do
  scenario 'users can sign up' do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page.current_path).to eq '/cheeps/index'
    expect(page).to have_content "Welcome, samjbro"
  end

  scenario "user can't sign up without an email address" do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content "Email must not be blank"
  end
  scenario "user can't sign up with an invalid email address" do
    expect{ sign_up(email: 'invalid@email') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content "Email has an invalid format"
  end
  scenario "user can't sign up with an already registered email address" do
    sign_up(email: "email@email.com")
    expect{ sign_up(email: "email@email.com") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content "Email is already taken"
  end
  scenario "user can't sign up with an already registered user name" do
    sign_up(user_name: "samjbro")
    expect{ sign_up(user_name: "samjbro") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content "User name is already taken"
  end

  scenario "user can't sign up with incorrect password confirmation" do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content "Password does not match the confirmation"
  end
end

feature 'Signing in' do
  let!(:user) do
    User.create(user_name: 'samjbro',
                name: 'Sam Broughton',
                email: 'sam@email.com',
                password: '12345',
                password_confirmation: '12345')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.user_name}"
  end
end

feature 'Signing out' do
  before(:each) do
    User.create(user_name: 'test',
                name: 'Testy McTestface',
                email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content 'Goodbye'
    expect(page).not_to have_content 'Welcome, test'
  end

end

feature 'Resetting password' do
  scenario 'When I forget my password I can see a link to reset' do
    visit '/sessions/new'
    click_link 'I forgot my password'
    expect(page).to have_content "Please enter your email address"
  end

  # scenario 'When I enter my email I am told to check my inbox' do
  #   visit '/users/recover'
  #   fill_in :email, with: "sam@email.com"
  #   click_button "Submit"
  #   expect(page).to have_content "Thanks, please check your inbox for the link."
  # end

end










