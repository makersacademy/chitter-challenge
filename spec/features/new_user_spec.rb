feature 'Creating new user' do
  scenario 'Creating new user increases number of users' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(current_path).to eq '/feed'
    expect(page).to have_content "Welcome Freddy"
  end

  scenario 'Cannot sign up twice' do
    sign_up
    expect{sign_up}.to change(User, :count).by(0)
    expect(page).to have_content("Email is already taken")
  end
end
