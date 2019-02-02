# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'users should see the time peeps were posted' do

  scenario 'peeps display created timestamp' do
    create_user
    valid_login
    post_one_message
    time = "#{Time.now.hour}" + ":" + "%02d" % Time.now.min.to_s
    expect(page).to have_content(time)
  end

end