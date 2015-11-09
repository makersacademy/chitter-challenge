feature 'the user can' do
  scenario 'post a peep' do
    visit'/peep/new'
    expect(page.status_code).to eq(200)
    fill_in :peep, with: 'Hi there!'
    click_button 'post it'
    save_and_open_page
    expect(page).to have_content('Hi there!')
  end
end
