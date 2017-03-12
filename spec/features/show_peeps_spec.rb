feature 'show all peeps' do
  scenario 'show a list of all peeps on the peeps route' do

    user = User.create(email: 'joemaidman@gmail.com', handle: 'Joe',
                     password: 'password',
                     password_confirmation: 'password')
    Peep.create(message:'Test Peep!!', user: user, date: Time.now)
    Peep.create(message:'Test Peep two!!', user: user, date: Time.now)
    visit '/peeps'
    expect(page).to have_content('Test Peep!!')
    expect(page).to have_content('Test Peep two!!')
    expect(page).to have_content("Joe on #{Time.now.strftime('%A, %d %b %Y')} @ #{Time.now.strftime('%l:%M %p')}")
  end
end
