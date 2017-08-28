feature 'Viewing first page' do
  scenario 'I see the first page' do
    visit('/')
    expect(page).to have_content
  end

  scenario 'I see a latest peeps button' do
    visit('/')
    find_button('Latest peeps').click
  end
end

feature 'Write new peep' do
  scenario 'I write new peep' do
    visit('/new')
    find_field('New peep').value
    find_button('Send peep').click
  end
end
