feature 'FEATURE: Sign in' do

  scenario "can access sign in page from home page" do
    visit('/')
    click_link('sign_in')
    expect(page.current_path).to eq "/sessions/new"
  end

  let(:name) { 'J T Kirk' }
  let(:email) { 'JTK@test.com' }
  let(:user_name) { 'TheShat' }
  let(:password) { 'password' }
  let(:password_confirmation) { 'password' }

  before do
    User.create(name: name, email: email, user_name: user_name, password: password, password_confirmation: password_confirmation)
  end

  scenario "can sign in with existing username and password" do
    sign_in(email, password)
    expect(page).to have_content("@#{user_name}")
  end

  scenario "cannot sign in with invalid email" do
    sign_in('wrongemail', password)
    expect(page).to have_content("Invalid email or password")
  end

  scenario "cannot sign in with invalid password" do
    sign_in(email, 'wrongpassword')
    expect(page).to have_content("Invalid email or password")
  end

  scenario "cannot click to sign in if already signed in" do
    sign_in(email, password)
    expect(page).not_to have_selector("#sign_in")
  end

end
