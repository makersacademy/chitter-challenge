feature 'peeps' do
  scenario 'homepage shows all peeps' do
    sign_in
    create_peep 'This is my first peep!'
    create_peep 'This is my second peep!'
    visit '/'
    expect(page).to have_content 'This is my first peep!'
    expect(page).to have_content 'This is my second peep!'
  end

  scenario 'I want to create a new peep' do
    sign_in
    visit '/peep/new'
    fill_in :body, with: 'This is a peep'
    click_button 'Peep!'
    expect(page).to have_content 'This is a peep'
  end

  scenario 'displays a time stamp on peep' do
    allow(Time).to receive(:now).and_return '2016-03-28 17:28:13 +0100'
    sign_in
    visit '/peep/new'
    fill_in :body, with: 'This is a peep'
    click_button 'Peep!'
    expect(page).to have_content "Peeped by JohnDude at 05:28PM on 03/28/2016"
  end

  scenario 'displays peeps in reverse cronological order' do
    sign_in
    create_peep 'This is my first peep!'
    create_peep 'This is my second peep!'
    visit '/'
    expect('This is my second peep!').to appear_before 'This is my first peep!'
  end

  scenario 'peeps include posters name' do
    sign_in
    visit '/peep/new'
    fill_in :body, with: 'This is a peep'
    click_button 'Peep!'
    expect(page).to have_content "Peeped by JohnDude"
  end

  scenario 'organise peeps by user' do
    sign_in
    visit '/peep/new'
    create_peep 'This is a peep'
    click_link('JohnDude')
    expect(page).to have_content "JohnDude"
    expect(page).to have_content "This is a peep"
  end
end
