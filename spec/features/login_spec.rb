feature 'user can log in' do

  scenario 'user can log in with valid email and password' do
    sign_up
    sign_in
    expect(page).to have_content("Hello @SuperRafi")
  end

  scenario 'user gets error message if cannot log in' do
    sign_up
    invalid_sign_in
    expect(page).to have_content("Invalid email or password. Try again!")
  end
end
