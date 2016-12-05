feature "Signing up to chitter:" do

  scenario "user signs up with correct confirmation password" do
    expect{ sign_up }.to change{ User.count }.by(1)
    expect(page).to have_content("Welcome to chitter johnnyboi")
  end

  scenario "user signs up with password mismatch" do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "user signs up with empty email address" do
    expect{ sign_up(email: nil) }.not_to change{User.count}
    expect(current_path).to eq('/users/new')
    expect(page).to have_content "Email must not be blank"
  end

  scenario "user signs up with invalid email address" do
    expect{ sign_up(email: "hello@foo") }.not_to change{User.count}
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario "user signs up with existing info" do
    sign_up
    expect{sign_up}.to_not change(User, :count)
  end

end
