# As a user
# So that I can know more about other users
# I want to view their name and all of their peeps on a profile page

feature 'Viewing Profiles' do
  before do
    Timecop.freeze
  end
  
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

  scenario 'displays the user\'s name' do
    visit '/users/joeb'
    expect(page).to have_content user.name
  end

  scenario 'displays the user\'s peeps in reverese chronological order' do
    visit '/users/joeb'
    expect(page).to have_selector("ul#peeps li:nth-child(1)", 
      text: second_peep.content)
    expect(page).to have_selector("ul#peeps li:nth-child(2)", 
      text: first_peep.content)
  end
  
  scenario 'displays author and time of posting peeps' do
    visit '/users/joeb'
    expect(page).to have_selector("ul#peeps li:nth-child(1)", text:
      "#{user.username} #{Time.now.strftime('on %a, %d %b %Y at %H:%M:%S ')}")
  end
end



  


  
