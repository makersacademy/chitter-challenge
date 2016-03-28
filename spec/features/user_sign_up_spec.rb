feature 'User sign up' do

  let(:user) { user = build(:user) }

  scenario 'new user sign up' do
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome #{user.name}")
    expect(User.first.email).to eq("#{user.email}")
  end

  scenario 'mismatching passwords' do
    user = build(:user, password_confirmation: "wrong")
    expect{ sign_up(user) }.not_to change(User, :count)
    expect(page).to have_content("Password does not match the confirmation")
  end

   scenario 'email and username not unique' do
     sign_up(user)
     sign_up(user)
     expect(page).to have_content("Email is already taken")
     expect(page).to have_content("Username is already taken")
   end
end
