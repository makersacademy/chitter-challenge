feature 'sign up' do
  scenario 'user signs up' do
    visit('/users/new')
    fill_in('email', with: ENV['MY_EMAIL'])
    fill_in('password', with: 'supersecretpassowrd')
    fill_in('name', with: 'Tom')
    fill_in('username', with: 'tomd')
    click_on 'Submit'
    expect(User.all[0].email).to eq ENV['MY_EMAIL']
  end
end
