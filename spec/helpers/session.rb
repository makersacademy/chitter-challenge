module SessionHelpers
  def sign_up(email: 'olivia@example.com',
          password: '12345678',
          password_confirmation: '12345678')
    visit('/makers/new')
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end

  def sign_in(email: 'olivia@example.com',
              password: '12345678')
    visit('/sessions/new')
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def creating_peep
    visit '/peep/new'
    fill_in :content, with: 'what a fabulous day'
    click_button 'Save'
    expect(current_path).to eq '/peeps'
  end

  # def recover_password
  #   visit '/makers/recover'
  #   fill_in :email, with: "olivia@example.com"
  #   click_button "Submit"
  # end
  #
  # def set_password(password:, password_confirmation:)
  #   visit("/makers/reset_password?token=#{maker.password_token}")
  #   fill_in :password, with: password
  #   fill_in :password_confirmation, with: password_confirmation
  #   click_button "Submit"
  # end
end
