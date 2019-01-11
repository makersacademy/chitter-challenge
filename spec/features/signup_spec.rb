RSpec.feature 'Signup' do 
  scenario 'user can signup' do 
    visit('/')
    click_on 'Sign Up'
    fill_in :first_name, with: 'Carol'
    fill_in :surname, with: 'Gardiner'
    fill_in :email, with: 'caz@caz.com'
    fill_in :password, with: 'secret123'
    expect(page.current_path).to eq '/profile'
  end
end