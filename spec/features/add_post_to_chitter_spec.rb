feature 'post a message' do
  scenario 'be able to post a message to chitter' do
    visit ('/')
    click_button('Add Peep')
    visit('/add_peep')
    fill_in(:message, with: "I'm Hungry.")
    click_button('Peep')
    expect(page).to have_content("I'm Hungry.")
  end
end
