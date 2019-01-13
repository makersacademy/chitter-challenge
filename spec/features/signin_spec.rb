RSpec.feature 'Sign in' do
  scenario 'user can sign in' do 
    visit('/signup')
    fill_in :firstname, with: 'Carol2'
    fill_in :surname, with: 'Gardiner2'
    fill_in :username, with: 'cazzy3'
    fill_in :email, with: 'caz@caz3.com'
    fill_in :password, with: 'secret123'
    click_on 'Sign up'
    visit('/signin')
    fill_in :username, with: 'cazzy3'
    fill_in :password, with: 'secret123'
    click_on 'Sign in'
    expect(page.current_path).to eq '/profile/1'
  end 
end
