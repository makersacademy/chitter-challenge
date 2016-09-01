module SessionHelpers

  def sign_up(full_name: 'Joe Sweeny',
              username: 'joesweeny',
              email: 'joesweeny84@hotmail.com',
              password: 'buddy123',
              password_confirmation: 'buddy123')
    visit '/'
    click_link 'Sign Up Here'
    fill_in :full_name, with: full_name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    within('div.footer') do
      click_button 'Sign Up'
    end
  end

  def sign_in(username:, password:)
    visit '/sessions/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
