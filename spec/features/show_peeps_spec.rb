feature 'show peeps' do
  scenario 'all peeps are shown in reverse chronological order' do
    user = User.create(
      name: 'Example Name',
      username: 'exampleusername',
      email: 'example@example.com',
      password: 'examplepassword'
    )
    Peep.create(text: 'First test peep', user_id: user.id)
    Peep.create(text: 'Second test peep', user_id: user.id)
    Peep.create(text: 'Third test peep', user_id: user.id)

    visit('/peeps')

    expect(first('.peep')).to have_content('Third test peep')
    expect(all('.peep')[1]).to have_content('Second test peep')
    expect(all('.peep')[2]).to have_content('First test peep')
  end

  scenario 'all peeps have the time they were created at' do
    user = User.create(
      name: 'Example Name',
      username: 'exampleusername',
      email: 'example@example.com',
      password: 'examplepassword'
    )
    peep = Peep.create(text: 'Test peep', user_id: user.id)

    visit('/peeps')

    expect(page).to have_content(peep.time)
  end
end
