def sign_up(args = {})
  visit '/users/new'
  within '#form_wrapper' do
    fill_in :email, with: args.fetch(:email, 'no@email.com')
    fill_in :handle, with: args.fetch(:handle, 'ainsleybc')
    fill_in :name, with: args.fetch(:name, 'Ainsley Chang')
    fill_in :password, with: 'password'
    click_button 'Sign Up!'
  end
end

def log_in(args)
  email = args.fetch(:email, 'no@email.com')
  password = args.fetch(:password, 'password')

  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Log in'
end

def log_out
  click_button 'Log out'
end
