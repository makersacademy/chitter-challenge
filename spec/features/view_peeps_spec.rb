feature do
  scenario 'visits homepage' do
    visit '/'
    expect(page).to have_content('Welcome to chitter')
  end

  scenario 'sees peeps' do
    visit '/'
    expect(page).to have_content('My first peep')
  end

  scenario 'adds peep' do
    visit '/'
    fill_in('peep', with: 'My second peep')
    click_on('submit')
    expect(page).to have_content('My second peep')
  end
end
