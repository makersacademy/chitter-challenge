feature "authentication" do

  scenario "Users can sign in" do
    User.create(name: 'Jim', username: 'Jimmy',
      email: 'abc@123.com', password: 'abc123')

    visit "sessions/new"
    fill_in(:email, with: "abc@123.com")
    fill_in(:password, with: "abc123")
    click_button("Sign in")

    expect(page).to have_content("Welcome Jimmy")
  end

  scenario "Error if incorrect email" do
    User.create(name: 'Jim', username: 'Jimmy',
      email: 'abc@123.com', password: 'abc123')

    visit "sessions/new"
    fill_in(:email, with: "fake@email.com")
    fill_in(:password, with: "abc123")
    click_button("Sign in")

    expect(page).not_to have_content("Welcome Jimmy")
    expect(page).to have_content("Incorrect email or password")
  end

  scenario "Error if incorrect password" do
    User.create(name: 'Jim', username: 'Jimmy',
      email: 'abc@123.com', password: 'abc123')

    visit "sessions/new"
    fill_in(:email, with: "abc@123.com")
    fill_in(:password, with: "hunter2")
    click_button("Sign in")

    expect(page).not_to have_content("Welcome Jimmy")
    expect(page).to have_content("Incorrect email or password")
  end
end
