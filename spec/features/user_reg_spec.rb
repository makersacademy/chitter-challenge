# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'First-time user can register' do
  scenario 'User enters registration details and is added to db' do
    expect{ sign_up }.to change { User.count }.by 1
  end
  scenario 'User cannot sign up when passwords do not match' do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change { User.count }
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password and confirmation password do not match'
  end
  scenario "User cannot sign up without entering email address" do
    expect { sign_up(email: '') }.not_to change { User.count }
  end
  scenario "User cannot sign up with invalid email address" do
    expect { sign_up(email: 'not_an_email') }.not_to change { User.count }
  end

end
