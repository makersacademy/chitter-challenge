feature 'FEATURE: user sign in' do
  include Helpers

  before do
    sign_up(username: "user123")
  end

  scenario 'with correct credentials' do
    sign_in(email: "email@email.com", password: "123")
    expect(page).to have_content "Welcome to Chitter, user123"
  end

  scenario 'with incorrect credentials' do
    sign_in(email: "email@email.com", password: "wrong")
    expect(page).to have_content "Incorrect email or password!"
  end
end
