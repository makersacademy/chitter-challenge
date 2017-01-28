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
    visit('/')
    click_link('sign_in')
    fill_in :email, with: email
    fill_in :password, with: password
    click_button('submit_sign_in')
    expect(page).to have_content("Welcome, @#{user_name}")
  end

  scenario "cannot sign in with invalid email" do
    visit('/')
    click_link('sign_in')
    fill_in :email, with: "wrongemail"
    fill_in :password, with: password
    click_button('submit_sign_in')
    expect(page).to have_content("Invalid email or password")
  end

  scenario "cannot sign in with invalid password" do
    visit('/')
    click_link('sign_in')
    fill_in :email, with: email
    fill_in :password, with: "wrongpassword"
    click_button('submit_sign_in')
    expect(page).to have_content("Invalid email or password")
  end

end
