feature 'Users' do

  scenario 'sign up and are redirected' do

      email = 'user@example.com'
      password = 'secret*123'
      visit '/'
      expect(page).to have_link "Sign Up"
      click_link 'Sign Up'

      expect(page).to have_content "Please fill in the fields below"

      expect {
        fill_in 'email', with: email
        fill_in 'password', with: password
        fill_in 'checkpassword', with: password
        click_button 'Sign Up!'
        expect(page).to have_content "Hi #{email}"
      }.to change { User.count }.by(+1)



    end

end
