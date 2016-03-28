feature 'peeps' do
  scenario 'homepage shows all peeps' do
    Peep.create(body: 'This is my first peep!', time: Time.now)
    Peep.create(body: 'This is my second peep!', time: Time.now)
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
    expect(page).to have_content "Peeped at 05:28PM on 03/28/2016"
  end

  scenario 'displays peeps in reverse cronological order' do
    Peep.create(body: 'This is my first peep!', time: Time.now)
    Peep.create(body: 'This is my second peep!', time: (Time.now + 3600))
    visit '/'
    expect('This is my second peep!').to appear_before 'This is my first peep!'
  end

  scenario 'organise peeps by user' do

  end
end
