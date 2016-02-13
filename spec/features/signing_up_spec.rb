
feature 'signing up' do
  scenario 'user visits sign up page and enters correct details' do
    sign_up(name:'user',email:'user@email.com',password:'password',password_confirmation:'password')
    users = User.all
    user = User.first
    expect(users.count).to eq(1)
    expect(user.email).to eq 'user@email.com'
  end

end
