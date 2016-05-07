module SessionHelpers

  PARAMS_CORRECT = {
                    email: "pepe@gmail.com",
                    password: "123",
                    password_confirmation: "123",
                    name: "Pepe Domingo Castaño",
                    username: "pepe1purito!"
                    }

  def set_params(h)
    params = PARAMS_CORRECT.dup
    params.merge!(h)
  end

  def sign_up(email:, password:, password_confirmation:, name:, username:)
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    fill_in :name, with: name
    fill_in :username, with: username
    click_button 'Sign up'
  end

  def sign_in(email:, password:)
    visit 'sessions/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def recover_password
   visit '/users/recover'
   fill_in :email, with: "alice@example.com"
   click_button "Submit"
 end

 def sign_in_and_peep(message)
  sign_in(email: user.email, password: user.password)
  visit '/peeps/new'
  fill_in :message, with: message
  click_button "Submit"
 end
end