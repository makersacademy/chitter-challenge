RSpec.feature 'Allows users' do
  scenario 'To post a peep to chitter' do
    visit('/chitter/new')
    fill_in('peep', with: 'I am happy today')
    click_on('submit')
    expect(page).to have_content('I am happy today')
  end
end
