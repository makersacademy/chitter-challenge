feature 'post' do
  scenario 'user can post message (peep) to chitter' do
    visit('/welcome')
    fill_in('message', with: 'Hello world')
    expect(page).to have_content("Hello World")
  end
end
