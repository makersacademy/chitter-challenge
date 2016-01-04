# As a user
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

# As a user
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'Viewing Peeps' do
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

  scenario 'displays the peeps in reverse chronological order' do
    visit '/peeps'
    expect(page).to have_selector("ul#peeps li:nth-child(1)", 
      text: second_peep.content)
    expect(page).to have_selector("ul#peeps li:nth-child(2)", 
      text: first_peep.content)
  end

  scenario 'displays authors and time of posting peeps' do
    visit '/peeps'
    expect(page).to have_selector("ul#peeps li:nth-child(1)", text:
      "#{user.username} #{Time.now.strftime('on %a, %d %b %Y at %H:%M:%S ')}")
  end
end
