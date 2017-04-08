require_relative '../../app/models/user'

feature 'signing up users' do
  scenario 'user signs up' do
    expect{signup}.to change(User, :count).by 1
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome, HappyFriends99'
  end

  scenario 'mismatching password and password confirmation' do
    expect{signup(password_confirmation: 'BANANAS!#@$')}.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end
end
