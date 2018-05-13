feature 'posting peeps to chitter' do
  scenario 'it displays a user message' do
    add_peeps
    visit('/peeps')
    fill_in 'peep', with: 'new peep'
    click_on 'submit'
    expect(page).to have_content 'new peep'
  end

  scenario 'it displays peeps in reverse order' do
    add_peeps
    time = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    visit('/peeps')
    expect(page).to have_content "My third peep\n#{time}\nMy second peep\n#{time}\nMy first peep\n#{time}"
  end
end
