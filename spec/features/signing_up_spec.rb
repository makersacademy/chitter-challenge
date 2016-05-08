feature 'signing up' do
  xscenario 'As a user I can sign up on the webpage' do
    def sign_up
      visit '/users/new'
      expect(page.status_code).to eq 200
      fill_in 'name', with: 'Emilio'
      fill_in 'email', with: 'youremail@someemail.com'
      fill_in 'password', with: '123456'
      click_button 'Sign up'
    end

    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Emilio')
    expect(User.first.email).to eq('youremail@someemail.com')
  end
end
