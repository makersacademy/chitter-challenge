feature 'Creating new user' do
  scenario 'Creating new user increases number of users' do
    expect{register_new_user}.to change(User, :count).by(1)
    expect(current_path).to eq '/feed'
    expect(page).to have_content "Welcome freddy@well.com"
  end
end
