feature 'viewing peeps' do
  scenario 'a list of all peeps can be viewed' do
    Peep.make_peep(maker: 'Kris', message: 'Hi, you are viewing a peep', time: '4:20pm')
    Peep.make_peep(maker: 'Lindsey', message: 'You are viewing this peep too!', time: '4:25pm')

    visit '/chitter'

    expect(page).to have_content 'Kris'
    expect(page).to have_content 'Hi, you are viewing a peep'
    expect(page).to have_content '4:20pm'
    expect(page).to have_content 'Lindsey'
    expect(page).to have_content 'You are viewing this peep too!'
    expect(page).to have_content '4:25pm'
  end
end