feature 'create a peep' do
  scenario 'users creates a peep' do
    visit 'peep/new'
    fill_in :message, with: 'my first peep'
    click_button 'Post'
    expect(page).to have_content 'my first peep'
  end
end

created_at = DateTime.now

feature 'peeps appear in reverse chronological order' do
  scenario 'viewing peeps on main page' do
    Peep.create(message: 'first', created_at: created_at)
    Peep.create(message: 'second', created_at: created_at)
    Peep.create(message: 'third', created_at: created_at)
    visit '/peeps'
    expect('third').to appear_before('first')
  end
end

feature 'peeps have the time they were created' do
  scenario 'checking what time a post was created' do
    Peep.create(message: 'test', created_at: created_at)
    visit '/peeps'
    expect(page). to have_content created_at.strftime("%H:%M %d/%m/%y")
  end
end
