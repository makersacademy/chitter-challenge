feature 'View Peeps' do
  scenario 'list of peeps on homepage' do
    visit '/'
    expect(page).to have_content 'This is so cool'
    expect(page).to have_content 'I am sending a peep'
    expect(page).to have_content 'Isolation #COVID-19'
  end
end
