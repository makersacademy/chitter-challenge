feature do
  scenario 'visits homepage' do
    visit '/'
    expect(page).to have_content('Welcome to chitter')
  end

  scenario 'sees peeps' do
    visit '/'
    fill_in('peep', with: 'My first peep')
    click_on('submit')
    expect(page).to have_content('My first peep')
  end

  scenario 'adds peep' do
    visit '/'
    fill_in('peep', with: 'My second peep')
    click_on('submit')
    expect(page).to have_content('My second peep')
  end

  scenario 'adds multiple peeps' do
    visit '/'
    fill_in('peep', with: 'My second peep')
    click_on('submit')
    fill_in('peep', with: 'My third peep')
    click_on('submit')
    expect(page).to have_content('My second peep')
    expect(page).to have_content('My third peep')
  end

  scenario 'peeps have timestamps' do
    allow(DateTime).to receive(:now).and_return("2018-10-26 15:55:19")
    visit '/'
    fill_in('peep', with: 'My second peep')
    click_on('submit')
    expect(page).to have_content("2018-10-26 15:55:19")
  end
end
