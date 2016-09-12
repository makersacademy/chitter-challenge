feature 'user can log in' do

  let!(:test_user) do
    sign_up
    Capybara.reset_session!
  end

  scenario 'user can log in with valid email and password' do
    sign_in
    expect(page).to have_content("Hello @SuperRafi")
  end

  scenario 'user gets error message if cannot log in' do
    invalid_sign_in
    expect(page).to have_content("Invalid email or password. Try again!")
  end
end
