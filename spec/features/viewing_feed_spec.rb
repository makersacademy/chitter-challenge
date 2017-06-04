feature 'personal feed of user' do
  scenario 'user can see button to make new peep' do
    sign_up
    click_button('New Peep')
    expect(current_path).to eq('/posts/new')
  end

  scenario 'posted peeps are time-stamped' do
    sign_up
    post_new_peep
    within 'ul#peeps' do
      expect(page).to have_content "#{Time.now.strftime("%d %b %Y %H:%M")} - Hello world!"
    end
  end

  scenario 'posted peeps are user-stamped' do
    sign_up
    post_new_peep
    within 'ul#peeps' do
      expect(page).to have_content "Hello world! - kkavita92"
    end
  end

  # scenario 'user can log in from page' do
  #   visit('/posts/all')
  #   click_button('Login')
  #   expect(current_path).to eq('/sessions/new')
  # end

  scenario 'user can sign up from page' do
    visit('/posts/all')
  end

end
