RSpec.feature 'Signup' do 
 
  scenario 'user can signup' do 
    visit('/signup')
    fill_in :firstname, with: 'Carol'
    fill_in :surname, with: 'Gardiner'
    fill_in :username, with: 'cazzy'
    fill_in :email, with: 'caz@caz.com'
    fill_in :password, with: 'secret123'
    click_on 'Sign up'
    expect(page.current_path).to eq '/profile/6'
  end
end
