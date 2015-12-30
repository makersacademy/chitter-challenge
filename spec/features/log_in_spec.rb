feature 'log in' do

  let(:name) { 'Camilla' }
  let(:username) { 'allimac' }
  let(:email) { 'camilla@email.com' }
  let(:password) { 'pass123' }

  before do
    register(name: name, username: username, email: email,
              password: password, password_confirmation: password)
  end

  scenario 'user logs in receiving a welcome back message' do
    login(email: email, password: password)
    expect(page.status_code).to eq 200
    expect(page).to have_content "Welcome back #{name}"
  end

  scenario 'user is warbed that the email or password entered are wrong' do
    login(email: email, password: 'wrongpass')
    expect(current_path).to eq '/login'
    expect(page).to have_content "Please double check your email or password"
  end
end
