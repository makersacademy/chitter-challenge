feature 'show peeps in reverse order' do
  scenario 'I want to see all peeps posted in reverse choronological order' do
    # Homepage.create(message: "message")
    visit('/homepage')
    click_button 'Add new message'
    fill_in('message', with: 'hello')
    click_button 'Submit Message'
    click_button 'Add new message'
    fill_in('message', with: 'hello2')
    click_button 'Submit Message'

    expect("hello2").to appear_before("hello")
    # expect(Homepage.first).to include('hello2')

  end
end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
