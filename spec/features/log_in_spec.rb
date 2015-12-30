feature 'log in' do

  let(:name) { 'Camilla' }
  let(:username) { 'allimac' }
  let(:email) { 'camilla@email.com' }
  let(:password) { 'pass123' }

  before do
    register(name: name, username: username, email: email, password: password, password_confirmation: password)
  end

  scenario 'user logs in receiving a welcome back message' do
    visit '/login'
    fill_in("email", with: email)
    fill_in("password", with: password)
    click_button("Login")
    expect(page.status_code).to eq 200
    expect(page).to have_content "Welcome back #{name}"
  end
end
