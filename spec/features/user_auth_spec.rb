RSpec.feature 'User Authentication' do
  context '4. Sign Up' do
    scenario 'A user can signup' do
      visit '/'
      click_on 'Sign Up'
      fill_in :name, with: 'test'
      fill_in :username, with: '@test'
      fill_in :email, with: 'test@test.com'
      fill_in :password, with: 'secret123'
      click_button 'Sign Up'

      expect(page).to have_content 'Welcome to the Peep Show @test'
    end
  end
end