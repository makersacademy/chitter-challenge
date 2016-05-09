feature 'can reply to peep' do

  before(:each) do
    sign_up
    post(content: 'Morning')
    click_button 'Log out'
    sign_up(email:'hulk@avergers.com', name:'Hulk', username:'Hulk')
  end

  scenario 'user can reply to another peep' do
    within 'ul#peeps' do
      fill_in :reply, with: 'Evening'
      click_button 'Submit reply'
    end
    expect(page).to have_content 'reply to Wonderland: Evening'
  end
end
