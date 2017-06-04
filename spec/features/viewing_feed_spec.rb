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
      expect(page).to have_content "#{Time.now.strftime("%d %b %Y %H:%M")}"
      expect(page).to have_content "Hello world!"
    end
  end

  scenario 'posted peeps are user-stamped' do
    sign_up
    post_new_peep
    within 'ul#peeps' do
      expect(page).to have_content "kkavita92"
      expect(page).to have_content "Hello world!"
    end
  end

  scenario 'user can log in from page' do
    visit('/posts/all')
    click_button('Login')
    expect(current_path).to eq('/sessions/new')
    expect(page.status_code).to eq 200
  end

  scenario 'user can sign up from page' do
    visit('/posts/all')
    click_button('Sign up')
    expect(current_path).to eq('/users/new')
    expect(page.status_code).to eq 200
  end

end
