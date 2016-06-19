feature "User registration" do
  let(:username) { "vannio" }
  let(:name) { "Van" }
  let(:email) { "van@email.com" }
  let(:password) { "password123" }

  scenario "user can register a new account" do
    visit("/user/new")

    fill_in(:username, with: username)
    fill_in(:name, with: name)
    fill_in(:email, with: email)
    fill_in(:password, with: password)
    fill_in(:password_confirm, with: password)

    expect{ click_button(:Register) }.to change{ User.all.count }.by(1)
    expect(current_path).to eq("/")
  end

  scenario "user cannot register existing username" do
    create_user
    visit("/user/new")

    fill_in(:username, with: username)
    fill_in(:name, with: name)
    fill_in(:email, with: "unique@email.com")
    fill_in(:password, with: password)
    fill_in(:password_confirm, with: password)

    expect{ click_button(:Register) }.to_not change{ User.all.count }
  end

  scenario "user cannot register existing email address" do
    create_user
    visit("/user/new")

    fill_in(:username, with: "unique")
    fill_in(:name, with: name)
    fill_in(:email, with: email)
    fill_in(:password, with: password)
    fill_in(:password_confirm, with: password)

    expect{ click_button(:Register) }.to_not change{ User.all.count }
  end

  scenario "user cannot register username with invalid characters" do
    visit("/user/new")

    fill_in(:username, with: "user n@me")
    fill_in(:name, with: name)
    fill_in(:email, with: email)
    fill_in(:password, with: password)
    fill_in(:password_confirm, with: password)

    expect{ click_button(:Register) }.to_not change{ User.all.count }
    expect(page).to have_content("Invalid username")
  end

  scenario "user cannot register when username is too short" do
    visit("/user/new")

    fill_in(:username, with: "user")
    fill_in(:name, with: name)
    fill_in(:email, with: email)
    fill_in(:password, with: password)
    fill_in(:password_confirm, with: password)

    expect{ click_button(:Register) }.to_not change{ User.all.count }
    expect(page).to have_content("Invalid username")
  end
end
