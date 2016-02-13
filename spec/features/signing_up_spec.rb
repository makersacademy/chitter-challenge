
feature 'signing up' do
  scenario 'user visits sign up page and enters correct details' do
    visit'/user/new'
    fill_in('name', with: 'Hannah')
    fill_in('email', with: 'hannah@hannah.com')
    fill_in('password', with: 'password')
    fill_in('password confirmation', with: 'password')
    click_button'Sign up'
    users = User.all
    user = User.first
    expect(users.count).to eq(1)
    expect(user.email).to eq 'hannah@hannah.com'

  end

end
