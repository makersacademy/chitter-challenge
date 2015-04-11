# cant add a peep if logged out
# can add a peep when logged in
# peeps have the users name attached

feature 'adding peeps' do

  before(:each) do
    User.create(email:'test@test.com',
            password:'12345',
            password_confirmation:'12345',
            name:'test_name',
            username:'user_numero_uno')
  end

  scenario 'is not possible when logged out' do
    peep
    expect(current_path).to eq '/'
    expect(page).not_to have_content('new peep!')
    # expect please log into post a peep
  end

  scenario 'is possible when logged in' do
    sign_in
    peep
    p current_path
    expect(page).to have_content('new peep!')
    # expect not to have please log in to post a peep
  end

end

def peep content = 'new peep!'
  visit '/peeps/new'
  fill_in :peep, with: content
  click_button 'peep'
end

def sign_in(email = 'test@test.com', password='12345')
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'log in'
end