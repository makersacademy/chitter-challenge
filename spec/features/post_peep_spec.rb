feature 'Posting a peep' do
  scenario 'user posts a peep; it appears on the page' do
    visit '/'
    fill_in('content', with: 'First peep!')
    click_on 'Peep'

    expect(current_path).to eq '/'
    expect(page).to have_content('First peep!')
  end
end
