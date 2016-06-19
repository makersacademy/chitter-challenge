feature "FEATURE: Sign up - general" do
  scenario "create new user on sign up" do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content("Welcome to Spitter, Solid Snake")
    expect(User.first.email).to eq('snake@mgs.com')
  end
end

feature "FEATURE: Sign up - password" do

  scenario "requires a matching confirmation password to sign up" do
    expect { sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
  end

  scenario "cannot sign up without a matching password combination" do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content  "Password does not match the confirmation"
  end

end

feature "FEATURE: Sign up - email address" do

  scenario "I can't sign up without an email address" do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "I can't sign up with an invalid email address" do
    expect{ sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario "I can't sign up with an email already registered with the site" do
    sign_up
    expect{ sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end

feature "FEATURE: Sign up - username" do

  scenario "I can't sign up without a username" do
    expect{ sign_up(username: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Username must not be blank')
  end

  scenario "I can't sign up with a username already registered with the site" do
    sign_up
    expect{ sign_up }.to_not change(User, :count)
    expect(page).to have_content('Username is already taken')
  end

end
