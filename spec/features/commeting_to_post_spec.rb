feature 'Commeting to a post' do

  before(:each) do
    sign_up
    log_in
    post_peep
  end

  scenario 'Each peep is labeled with it\'s id' do
    within 'div#chitters' do
      expect(page).to have_xpath('//p[@id="1"]')
    end
  end

  scenario 'Each peep has a comment button with the same id' do
    within 'div#chitters' do
      expect(page).to have_xpath('//input[@type="hidden"][@name="id"]')
    end
  end
  # scenario 'User can comment to an existing post' do
  #   sign_up
  #   log_in
  #   post_peep
  #   log_out
  #   sign_up(name: 'Clemence Guillaume',
  #           username: 'clems',
  #           email: 'clemence.guill@gmail.com',
  #           password: 'clems',
  #           password_confirmation: 'clems')
  #   expect(page).to have_xpath()
  # end
end
