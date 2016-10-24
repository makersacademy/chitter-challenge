def sign_up
  visit '/new_user'
  fill_in :name, with: 'Lilian Breidenbach'
  fill_in :username, with: 'Lilian21'
  fill_in :email, with: 'lil.gmail.com'
  fill_in :password, with: 'lemonaid'
  fill_in :password_confirmation, with: 'lemonaid'
  click_button 'Sign up'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

def new_user
  let!(:user) do
    User.create(name: 'Lilian Breidenbach',
                username: 'Lilian2112',
                email: 'lilian.gmail.com',
                password: 'lemonaid',
                password_confirmation: 'lemonaid')
  end
end
