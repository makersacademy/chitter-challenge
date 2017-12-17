feature 'View peep' do

  scenario 'see the peep on the page' do
  Peep.create(msg: 'Hi, this is peep1')
  visit('/peeps')
   expect(page.status_code).to eq 200
  expect(page).to have_content('Hi, this is peep1')
  end

  scenario 'see peeps in reverse chronological order' do
    Peep.create(msg: 'Hi, this is peep1')
    Peep.create(msg: 'Hi, this is peep3')
    visit('/peeps')
     expect(page.status_code).to eq 200
    expect('Hi, this is peep3').to appear_before('Hi, this is peep1')
    end

end
feature 'Creating peeps' do

  scenario 'submission to have a form and a Create peep button' do
    visit('/peeps/new')
    expect(page).to have_button('Create peep')
  end

  scenario 'user can write a peep ' do
    visit('peeps/new')
    fill_in 'msg', with: "Hello, this is peep2"
    click_button 'Create peep'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Hello, this is peep2')
    end
  end

end
