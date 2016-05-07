feature 'Viewing messages' do
  scenario 'As a user I can see a message' do
    Peep.create(title: 'Thought of the day', message: 'Hungover!')
    visit '/posts'
    expect(page.status_code).to eq 200
    within 'ul#posts' do
    expect(page).to have_content('Hungover!')
    end
  end
end
