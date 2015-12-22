feature 'Signing up' do
  scenario 'A user can sign up to Chitter' do
    visit '/users/new'
    fill_in :name, with: 'Katie'
    fill_in :username, with: 'Smith'
    fill_in :email, with: 'katie@email.com'
    fill_in :password, with: 'London'
    fill_in :password_confirmation, with: 'London'
    expect{ click_button 'Submit' }.to change(User, :count).by(1)
  end
end
