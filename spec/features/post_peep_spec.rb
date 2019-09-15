feature 'Post a status' do
  scenario 'able to post a status on Chitter' do
    visit('/')
    click_button 'Peep!'
    visit('/add_peep')
    fill_in :message, with: "its not the best"
    click_button 'Post Peep!'
    expect(page).to have_content "its not the best"
  end
end
