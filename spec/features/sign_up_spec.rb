feature 'sign up' do
  scenario 'allow an user to sign up into Chitter' do
    visit('/')
    click_button('Start')
    fill_in 'username', :with => 'Leo'
    fill_in 'email', :with => 'haha@gmail.com'
    fill_in 'password', :with => '12345'
    click_button('Submit')
  end
end
