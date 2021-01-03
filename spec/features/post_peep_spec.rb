feature 'Posting peeps' do
  scenario '.create' do
    visit '/chitter'
    fill_in :text, with: "New peep added"
    click_button 'Post Peep'

    expect(page).to have_content "New peep added"
  end
end
