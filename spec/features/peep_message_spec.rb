feature 'Send a message' do
  scenario 'type and send message to chitter' do
    visit('/chitter/peep')
    fill_in('message', :with => 'Hi there!')
    click_button("peep")
    expect(page).to have_content 'Hi there!'
  end
end
