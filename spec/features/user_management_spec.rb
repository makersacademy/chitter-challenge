feature 'users signup' do
  
  scenario 'users can create account' do
    visit '/users/new'
    within 'form#signup-form' do
      fill_in 'email', with: 'mail@marioribeiro.com'
      fill_in 'username', with: 'marioribeiro'
      fill_in 'password', with: 'mypassword'
    end
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq('mail@marioribeiro.com')
  end

end
