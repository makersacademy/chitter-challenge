feature 'Logging in' do

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
  context 'with correct details' do
    scenario 'welcomes us on the homepage' do
      sign_in
      expect(current_path).to eq '/'
      expect(page).to have_content('Welcome, user_numero_uno')
    end
  end

  context 'with incorrect details' do
    scenario 'we are prompted to log in again' do
      sign_in('test@test.com', '4567')
      expect(current_path).to eq('/sessions/new')
    end
    scenario 'and given a warning' do
      sign_in('test@test.com', '4567')
      expect(page).to have_content('email or password is incorrect')
    end
  end
end

# would we want to remember our email in this form or not?

def sign_in(email = 'test@test.com', password='12345')
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'log in'
end