feature 'see time peep was made' do
  scenario 'I want to see the time each individual peep was made' do
    # Homepage.create(message: "message")
    visit('/homepage')
    click_button 'Add new message'
    fill_in('message', with: 'hello')
    click_button 'Submit Message'

    expect(page.find('li:nth-child(1)')).to have_content "#{Time.now.strftime("%d/%b/%Y %H:%M")}"
  end
end

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made
