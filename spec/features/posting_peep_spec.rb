feature 'posting peeps to chitter' do
  scenario 'it displays a user message' do
    add_peeps
    visit('/peeps')
    fill_in 'peep', with: 'new peep'
    click_on 'submit'
    expect(page).to have_content 'new peep'
  end
end
