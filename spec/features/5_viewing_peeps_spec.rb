# As a user
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'Viewing Peeps' do
  let!(:user) do
    User.create(name: 'Joe Bloggs',
                username: 'joeb',
                email: 'joe.bloggs@gmail.com',
                password: 'jo3ble0bl3',
                password_confirmation: 'jo3ble0bl3')
  end

  let!(:first_peep) do
    Peep.create(user: user, 
                content: 'Hey everyone... My first Peep!')
  end

  let!(:second_peep) do
    Peep.create(user: user,
                content: "Oh btw the name's Bloggs, Joe Bloggs.")
  end

  scenario 'displays the peeps and authors in reverse chronological order' do
    visit '/peeps'
    expect(page).to have_selector("ul#peeps li:nth-child(1)", 
      text: user.username + ': ' + second_peep.content)
    expect(page).to have_selector("ul#peeps li:nth-child(2)", 
      text: user.username + ': ' + first_peep.content)
  end
end
