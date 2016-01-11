feature 'log in' do
  include SessionHelpers

  let(:name) { 'Camilla' }

  before do
    register(name: name)
    Capybara.reset!
  end

  scenario 'receiving a welcome back message' do
    login
    expect(page.status_code).to eq 200
    expect(page).to have_content "Welcome back #{name}"
  end

  scenario 'is prevented when password entered is wrong' do
    login(password: 'wrongpass')
    expect(current_path).to eq '/login'
    expect(page).to have_content "Please double check your email or password"
  end

  scenario 'is prevented when email entered is wrong' do
    login(email: 'wrong@email.com')
    expect(current_path).to eq '/login'
    expect(page).to have_content "Please double check your email or password"
  end
end
