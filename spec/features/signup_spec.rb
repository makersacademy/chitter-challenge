RSpec.feature 'User Authentication' do

  context 'Sign Up' do
    scenario 'A user can signup' do
      visit '/'
      click_on 'Sign up'
      fill_in :name, with: 'Ed'
      fill_in :username, with: 'edcourage'
      fill_in :email, with: 'ed@ed.com'
      fill_in :password, with: 'mynameised'
      click_button 'Sign up'
      expect(page.current_path).to eql '/profile'
    end
  end


end
