# As a user
# So that I can start a conversation with other users
# I want to reply to a peep

feature 'Replying to Peeps' do
  let!(:peeper) do
    User.create(name: 'Joe Bloggs',
                username: 'joeb',
                email: 'joe.bloggs@gmail.com',
                password: 'jo3ble0bl3',
                password_confirmation: 'jo3ble0bl3')
  end
  
  let!(:replyer) do
    User.create(name: 'John Doe',
                username: 'john',
                email: 'j.doe@gmail.com',
                password: 'jo3smell5',
                password_confirmation: 'jo3smell5')
  end

  let!(:joes_peep) do
    Peep.create(user: peeper,
                content: 'Who\'s this new guy think he is anyway?')
  end



  scenario 'nests the reply below the peep' do
    sign_in(username: replyer.username, password: replyer.password)
    click_on 'Reply'
    fill_in 'content', with: 'Que?! Soy John!'
    click_button 'Reply'
    expect(Reply.first.user).to eq replyer
    within 'ul#peeps' do
      expect(page).to have_selector("ul#replies", text: 'Que?! Soy John!') 
    end
  end
 
  scenario 'flashes error if attempt to reply when not logged in' do
    visit '/peeps'
    click_on 'Reply'
    fill_in 'content', with: 'Who am i'
    click_button 'Reply' 
    expect(page).to have_content 'User must not be blank'
  end

  scenario 'flashes error if content over 140 characters' do
    visit '/peeps'
    click_on 'Reply'
    fill_in 'content', with: ('replyyy' * 140)
    click_button 'Reply' 
    expect(page).to have_content(
      'Content must be between 1 and 140 characters long'
    )
  end
end
