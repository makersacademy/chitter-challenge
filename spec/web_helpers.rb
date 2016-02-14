module SessionHelpers

  def sign_up_good
    visit '/'
    within 'div.sign_up' do
      fill_in 'user_name', with: 'Le Jockey'
      fill_in 'password', with: 'password123'
      fill_in 'password_confirmation', with: 'password123'
      fill_in 'email', with: 'le_jockey@jockeyrecords.com'
      click_button('Bizarre Initiation Ceremony This Way')
    end
  end

  def sign_up_bad_password
    visit '/'
    within 'div.sign_up' do
      fill_in 'user_name', with: 'Le Jockey'
      fill_in 'password', with: 'password123'
      fill_in 'password_confirmation', with: 'password'
      fill_in 'email', with: 'le_jockey@jockeyrecords.com'
      click_button('Bizarre Initiation Ceremony This Way')
    end
  end

  def sign_up_bad_username
    sign_up_good
    visit '/'
    within 'div.sign_up' do
      fill_in 'user_name', with: 'Le Jockey'
      fill_in 'password', with: 'password123'
      fill_in 'password_confirmation', with: 'password123'
      fill_in 'email', with: 'lejockey@jockeyrecords.com'
      click_button('Bizarre Initiation Ceremony This Way')
    end
  end

  def sign_up_bad_email
    sign_up_good
    visit '/'
    within 'div.sign_up' do
      fill_in 'user_name', with: 'Jockey'
      fill_in 'password', with: 'password123'
      fill_in 'password_confirmation', with: 'password123'
      fill_in 'email', with: 'le_jockey@jockeyrecords.com'
      click_button('Bizarre Initiation Ceremony This Way')
    end
  end

  def sign_in_good
    sign_up_good
    visit '/'
    within 'div.sign_in' do
      fill_in 'existing_user_name', with: 'Le Jockey'
      fill_in 'existing_password', with: 'password123'
      click_button('Secret Member\'s Handshake')
    end
  end

  def sign_in_bad_username
    sign_up_good
    visit '/'
    within 'div.sign_in' do
      fill_in 'existing_user_name', with: 'Jockey'
      fill_in 'existing_password', with: 'password123'
      click_button('Secret Member\'s Handshake')
    end
  end

  def post_peep
    sign_in_good
    visit '/chitter'
    fill_in 'peep', with: 'Here\'s Johny'
    click_button 'Word Vom'
    @time = Time.now
  end

  def post_peep_no_author
    visit '/chitter'
    fill_in 'peep', with: 'Here\'s Johny'
    click_button 'Word Vom'
    @time = Time.now
  end

  def post_peep_2
    sign_in_good
    visit '/chitter'
    fill_in 'peep', with: 'Another futile peep'
    click_button 'Word Vom'
  end

  def post_peep_long
    sign_in_good
    visit '/chitter'
    long_peep = 'Too long for Hound. Hound is crying' * 5
    fill_in 'peep', with: long_peep
    click_button 'Word Vom'
  end


end
