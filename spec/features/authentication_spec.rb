feature '.authentication' do
  it 'a user can sign in' do
    User.create(email: "test@example.com", password: "password123", username: "test12")

    visit '/sessions/new'
    fill_in(:email, with: "test@example.com")
    fill_in(:password, with: "password123")
    click_button('Sign in')

    expect(page).to have_content "Welcome test12"
  end

  scenario 'a user gets an error if they input their email in wrong' do
    User.create(email: "test@example.com", password: "password123", username: "test12")

    visit '/sessions/new'
    fill_in(:email, with: "wrong@example.com")
    fill_in(:password, with: "password123")
    click_button('Sign in')

    expect(page).not_to have_content "Welcome test12"
    expect(page).to have_content "Email or password incorrect, please try again"
  end

  scenario 'a user gets an error if they input their password in wrong' do
    User.create(email: "test@example.com", password: "password123", username: "test12")

    visit '/sessions/new'
    fill_in(:email, with: "test@example.com")
    fill_in(:password, with: "sassword123")
    click_button('Sign in')

    expect(page).not_to have_content "Welcome test12"
    expect(page).to have_content "Email or password incorrect, please try again"
  end
end