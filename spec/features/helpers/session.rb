module SessionHelpers

  def sign_up(name = "Iciar",
              username = "Icicleta",
              email = "iciar@icicleta.com",
              password = "holaCaracola",
              password_confirmation = "holaCaracola")
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end

  def sign_in username = 'Icicleta', password = 'holaCaracola'
    visit '/sessions/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Sign In'
  end

end
