

feature 'User can sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    visit '/'
    expect(page).to have_content('Welcome, elinnet@gmail.com')
    expect(User.last.email).to eq('elinnet@gmail.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong')}.not_to change(User,:count)
  end

  # def sign_up(email: 'elinnet@gmail.com', name: 'Elin', password: 'password', password_confirmation: 'password')
  #     visit '/user/new'
  #     expect(page.status_code).to eq(200)
  #     fill_in :email, with: email
  #     fill_in :name, with: name
  #     fill_in :password, with: password
  #     fill_in :password_confirmation, with: password_confirmation
  #     click_button 'Sign up'
  # end
end
#Need to add function for error message stating multiple errors, attempts to sign up with existing email

feature 'User sign in' do
  let(:user) do
    User.create(email: 'elinnet@gmail.com',
              password: 'password',
              password_confirmation: 'password')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

feature 'User signs out' do

  before(:each) do
    User.create(email: 'elinnet@gmail.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'while being signed in' do
    sign_in(email: 'elinnet@gmail.com', password: 'password')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!') 
    expect(page).not_to have_content('Welcome, elinnet@gmail.com')
  end

end








  end







  
