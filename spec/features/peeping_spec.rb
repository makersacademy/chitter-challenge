feature 'can post a peep on chitterchatter' do
  before(:each) do
    User.create(email: 'harry@smith.com',
    password: '1234', password_confirmation: '1234')
  end

  scenario 'i can peep a message and is displayed' do
    sign_in(email: 'harry@smith.com', password: '1234')
    visit '/peeps/new'

    fill_in :peep_text, with: 'Hello World!'
    click_button 'peep'

    within 'ul#peeps' do
    expect(page).to have_content('Hello World!')
    end
  end
  scenario 'peeps are in reverse chronological order' do
    sign_in(email: 'harry@smith.com', password: '1234')
    visit '/peeps/new'
    
    fill_in :peep_text, with: 'Hello World!'
    click_button 'peep'
    fill_in :peep_text, with: 'Hello World2!'
    click_button 'peep'

  end
end
