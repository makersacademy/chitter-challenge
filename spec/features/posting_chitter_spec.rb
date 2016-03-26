feature 'Posting a chitter' do

  scenario 'User can post a chitter when logged in' do
    sign_up
    log_in
    expect{ post_peep }.to change(Post, :count).by(1)
    timestamp = Time.now.strftime("%I:%M%p %m/%d/%Y")

    within 'div#chitters' do
      expect(page).to have_content('Test post')
      expect(page).to have_content("jinis peeped @ #{timestamp}")
    end
  end

  scenario 'User can\'t post without a message' do
    sign_up
    log_in
    fill_in('message', with: nil)
    expect{ click_button('Peep') }.not_to change(Post, :count)
  end

  scenario 'User can\'t post without logging in' do
    visit('/home')
    expect(page).not_to have_xpath('//div[@id = "post"]')
  end

  scenario 'User can see posts when visiting as a guest' do
    visit('/')
    click_button('Continue as guest')
    expect(current_path).to eq('/home')
    expect(page).to have_xpath('//div[@id="chitters"]')
  end
end
