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

  def sign_up_another_user
    visit '/'
    within 'div.sign_up' do
      fill_in 'user_name', with: 'Kokokitscha'
      fill_in 'password', with: 'password'
      fill_in 'password_confirmation', with: 'password'
      fill_in 'email', with: 'kokokitscha@jockeyrecords.com'
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

  def sign_in_good_another_user
    sign_up_another_user
    visit '/'
    within 'div.sign_in' do
      fill_in 'existing_user_name', with: 'Kokokitscha'
      fill_in 'existing_password', with: 'password'
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
    within 'div.post_peep' do
      fill_in 'peep', with: 'Here\'s Johny'
      click_button 'Word Vom'
    end
  end

  def another_post_peep
    sign_in_good_another_user
    visit '/chitter'
    within 'div.post_peep' do
      fill_in 'peep', with: 'Here\'s Johny'
      click_button 'Word Vom'
    end
  end


  def post_peep_no_author
    visit '/chitter'
    within 'div.post_peep' do
      fill_in 'peep', with: 'Here\'s Johny'
      click_button 'Word Vom'
    end
  end

  def post_peep_2
    sign_in_good
    visit '/chitter'
    within 'div.post_peep' do
      fill_in 'peep', with: 'Another futile peep'
      click_button 'Word Vom'
    end
  end

  def post_peep_long
    sign_in_good
    visit '/chitter'
    within 'div.post_peep' do
      long_peep = 'Too long for Hound. Hound is crying' * 5
      fill_in 'peep', with: long_peep
      click_button 'Word Vom'
    end
  end

  def comment_on_peep
    another_post_peep
    within 'div.single_peep' do
      within 'div.comment_box' do
        fill_in 'comment', with: 'Here\'s a comment'
        click_button 'Boom Baby'
      end
    end
  end


end
