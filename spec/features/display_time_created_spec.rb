# User story
# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'Display time peep is created' do
  scenario 'A user can see what time each peep is created in the public stream' do
    visit '/peeps/new'
    fill_in('content', with: 'This is a test peep!')
    click_button 'Post'
    expect(page).to have_content /\d{2}:\d{2} \d{2}-\d{2}-\d{4}/
  end
end