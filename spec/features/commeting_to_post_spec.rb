feature 'Commeting to a post:' do

  before(:each) do
    sign_up
    log_in
    post_peep
  end

  scenario 'Each peep has a comment field with the same id as the post' do
    within 'div#chitters' do
      expect(page).to have_xpath('//input[@type="hidden"][@name="id"]')
    end
  end

  scenario 'Same user can comment to an existing post' do
    comment
    timestamp = Time.now.strftime("%I:%M%p %m/%d/%Y")
    expect(page).to have_content('Test comment')
    expect(page).to have_content("jinis commented @ #{timestamp}")
  end

  scenario 'Different user can comment to an existing post' do
    log_out
    sign_up(name: 'Clemence Guillaume',
            username: 'clems',
            email: 'clemence.guill@gmail.com',
            password: 'clems',
            password_confirmation: 'clems')
    comment
    timestamp = Time.now.strftime("%I:%M%p %m/%d/%Y")
    expect(page).to have_content('Test comment')
    expect(page).to have_content("clems commented @ #{timestamp}")
  end

  scenario 'Comments are desiplayed in reverse chronological order' do
    comment
    comment2
    page.body.index('Test comment 2') < page.body.index('Test comment')
  end
end
