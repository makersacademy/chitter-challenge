feature 'post message' do
  scenario 'be able to post a message to chitter' do
    visit '/'
    fill_in("peep", with: 'Test peep')
    click_button("Send Peep")
    expect(page).to have_content 'Test peep'
  end
end