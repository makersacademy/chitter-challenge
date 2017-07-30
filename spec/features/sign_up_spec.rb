feature 'Sign up' do

  scenario 'I can sign up as a new user to Chitter' do
    sign_up("Jon Snow", "kingofthenorth", "jon@winterfell.com", "winterishere", "winterishere")
    expect(User.all.count).to eq 1
    expect(page).to have_content "Welcome, Jon Snow"
  end

  scenario 'I cannot sign up if my username already exists' do
    sign_up_first
    sign_up("Ramsay Bolton", "kingofthenorth", "ramsay@mwhaha.com", "reek!reek!", "reek!reek!")
    expect(User.all.count).to eq 1
    expect(page).to have_content "Username is already taken"
  end

  scenario 'I cannot sign up if my email already exists' do
    sign_up_first
    sign_up("Hodor", "hodorhodorhodor", "jon@winterfell.com", "hodorhodor!", "hodorhodor!")
    expect(User.all.count).to eq 1
    expect(page).to have_content "Email is already taken"
  end

  scenario 'I cannot sign up if I enter incorrect password confirmation' do
    sign_up("Arya Stark", "agirlhasnoname", "arya@notwinterfel.com", "needle", "nymeria")
    expect(User.all.count).to eq 0
    expect(page).to have_content "Password does not match the confirmation"
  end
end
