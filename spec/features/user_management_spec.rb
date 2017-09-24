feature 'User Sign Up' do
  def sign_up
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name, with: 'James Hughes'
    fill_in :email, with: 'hugjimbo77@gmail.com'
    fill_in :username, with: 'JimboOnFire'
    fill_in :password, with: 'secretpassword'
    click_button('Sign Up')
  end

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, hugjimbo77@gmail.com')
    expect(User.first.email).to eq('hugjimbo77@gmail.com')
  end
end
