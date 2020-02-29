feature 'editing peeps' do
  scenario 'user edits a peep' do
    Peep.create(body: 'My first peep', time_posted: Time.now)
    visit '/peeps'

    first('.peep').click_button 'Edit'
    fill_in 'body', with: 'Hello world!'
    click_button 'Update'

    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content 'My first peep'
    expect(page).to have_content 'Hello world!'
  end
end
