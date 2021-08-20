feature 'Allows a user to post a message to chitter' do
  scenario 'User can post a message by filling out the message box then post it' do
    visit('/peeps/index')
    find_field('peep')
    fill_in 'peep', with: "How is everyone?"
    click_button('Peep it')
    expect(page).to have_content("How is everyone?")
  end


end