module SessionHelpers

  def sign_up_good
    visit '/'
    fill_in 'user_name', with: 'Le Jockey'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    fill_in 'email', with: 'le_jockey@jockeyrecords.com'
    click_button('Bizarre Initiation Ceremony This Way')
  end

  def sign_up_bad_password
    visit '/'
    fill_in 'user_name', with: 'Le Jockey'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password'
    fill_in 'email', with: 'le_jockey@jockeyrecords.com'
    click_button('Bizarre Initiation Ceremony This Way')
  end

  def sign_up_bad_username
    sign_up_good
    visit '/'
    fill_in 'user_name', with: 'Le Jockey'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    fill_in 'email', with: 'le_jockey@jockeyrecords.com'
    click_button('Bizarre Initiation Ceremony This Way')
  end

end
