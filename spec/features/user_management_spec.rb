

feature 'User sign up' do


  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, pip')
    expect(User.first.email).to eq('pip@example.com')
  end


  def sign_up(email: 'pip@example.com',
              password: 'sausages')
      visit '/users/new'
      expect(page.status_code).to eq(200)
      fill_in :name, with: 'Philip Clarke'
      fill_in :username, with: 'pip'
      fill_in :email, with:("pip@example.com")
      click_button 'Sign up'
  end
end
