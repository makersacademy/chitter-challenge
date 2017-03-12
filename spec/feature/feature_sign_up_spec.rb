# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature "sign up" do
  scenario "user can sign up for Chitter" do
    sign_up
    expect(page).to have_content 'Welcome, Natalia!'
    expect(page).to have_content 'Username: Nat-Nat'
    expect(page).to have_content 'E-mail: nst@mail.com'
  end
end
