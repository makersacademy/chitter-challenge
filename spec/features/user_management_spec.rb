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

  scenario "user can't sign up with incorrect password confirmation" do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content "Password does not match the confirmation"
  end
end

feature 'Signing in' do
  let!(:user) do
    User.create(user_name: 'samjbro',
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












