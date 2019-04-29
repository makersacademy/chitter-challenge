feature 'New peep' do
  scenario 'A user can post a peep' do
    visit('/')
    click_button 'New_peep'
    fill_in 'content', with: "Chitter rocks!"
    click_button 'peep'
    expect(page).to have_content "Chitter rocks!"
  end
end
