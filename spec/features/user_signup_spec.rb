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

  scenario 'cant leave email box empty' do
    expect{signup(email: nil)}.not_to change(User, :count)
  end

  scenario 'cant give an invalid email address' do
    expect{signup(email: 'baaaanaaanaaaa')}.not_to change(User, :count)
  end

  scenario 'cant leave username box empty' do
    expect{signup(username: nil)}.not_to change(User, :count)
  end

  scenario 'should prevent duplicate sign up' do
    signup
    visit '/users/new'
    expect{signup}.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end
