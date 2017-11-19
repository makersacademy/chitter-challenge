feature 'create a peep' do
  scenario 'users creates a peep' do
    visit 'peep/new'
    fill_in :message, with: 'my first peep'
    click_button 'Post'
    expect(page).to have_content 'my first peep'
  end
end

feature 'peeps appear in reverse chronological order' do
  scenario 'viewing peeps on main page' do
    Peep.create(message: 'first')
    Peep.create(message: 'second')
    Peep.create(message: 'third')
    visit '/peeps'
    expect('third').to appear_before('first')
  end
end
