# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'user sign up' do
  scenario 'a user may sign up to Chitter' do
    expect{ sign_up }.to change(User, :count).by (1)
    expect(page).to have_content "Edward, Welcome to Chitter!"
    expect(User.first.email).to eq ('edwardkerry@gmail.com')
  end
end
