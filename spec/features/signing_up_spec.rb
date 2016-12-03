feature "Signing up to chitter:" do

  scenario "user signs up with correct confirmation password" do
    expect{ sign_up }.to change{ User.count }.by(1)
    expect(page).to have_content("Welcome to chitter johnnyboi")
  end

  scenario "user signs up with password mismatch" do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users/create')
    expect(page).to have_content 'Password and confirmation do not match'
  end

  def sign_up(
    email: "hello@gmail.com",
    password: "averystrongpassword",
    password_confirmation: "averystrongpassword",
    name: "John Johnson",
    username: "johnnyboi"
    )
    visit '/users/new'
    fill_in("email", with: email)
    fill_in("password", with: password)
    fill_in("password_confirmation", with: password_confirmation )
    fill_in("name", with: name)
    fill_in("username", with: username)
    click_button("Submit")
  end

end
