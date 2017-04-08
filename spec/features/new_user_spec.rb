feature 'Creating new user' do
  scenario 'Creating new user increases number of users' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(current_path).to eq '/feed'
    expect(page).to have_content "Welcome freddy@chillvibes.com"
  end
end
