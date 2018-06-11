feature "A user can sign up for Chitter" do
  scenario 'A user can sign up for Chitter' do
    visit('/')
    click_on 'Sign up'
    fill_in('email', with: 'fakemail@mail.com')
    fill_in('password', with: 'password')
    fill_in('name', with: 'Bob Ross')
    fill_in('username', with: 'BobRossPaints')
    click_button 'Sign up'
  end
end
