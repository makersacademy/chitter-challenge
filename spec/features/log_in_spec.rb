feature 'logging in' do

  before(:each) do
    User.create(email:'test@test.com',
            password:'12345',
            password_confirmation:'12345',
            name:'test_name',
            username:'user_numero_uno')
  end
  
  context 'when we havent logged in' do
    scenario 'we are not logged in' do
      visit '/'
      expect(page).not_to have_content('Welcome, user_numero_uno')
    end
    scenario 'we are presented a log in form' do
      visit '/sessions/new'
      expect(page).to have_content('log in')
    end
  end
end