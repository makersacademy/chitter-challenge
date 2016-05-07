feature 'Posting messages' do
  scenario 'As a user I can post a message' do
    visit '/posts'
    Peep.create(title: 'Thought of the day', message: 'Hungover!')
    expect(page.status_code).to eq 200
    within 'ul#posts' do
    expect(page).to have_content('Hungover!')
    end
  end
end
