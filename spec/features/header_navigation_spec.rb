RSpec.feature 'Header Navigation' do

  context 'user not signed in arrives on app home page' do

    it 'A user can see sign in' do
        visit '/'
        expect(page).to have_selector(:css, 'a[href="/signin"]')
    end


    it 'A user can see sign up' do
      visit '/'
      expect(page).to have_selector(:css, 'a[href="/signup"]')
    end
  end

  context ' a user is signed in' do 

    it 'should display logout option' do
      generic_signup 
      expect(page).to have_selector(:css, 'a[href="/logout"]')
    end
  end 

end
