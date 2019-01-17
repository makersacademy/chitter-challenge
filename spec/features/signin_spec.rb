RSpec.feature 'Signin' do


  let!(:user) { User.create(
               :name => "Beatrice",
               :username => "beacourage",
               :email => "bea@bea.com",
               :password => "hello12345"
                )}

  context 'Sign in' do
    scenario 'A user can signin' do
      visit '/'
      click_on 'Sign in'
      fill_in :email, with: "bea@bea.com"
      fill_in :password, with: "hello12345"
      click_button 'Sign in'
      expect(page.current_path).to eql '/profile'
    end

  end
end
