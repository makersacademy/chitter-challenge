require 'orderly'

feature 'chronological order' do
  scenario 'peeps on the homepage appear in reverse chronological order' do
    Peep.create(peep: 'last', name: 'Phil')
    Peep.create(peep: 'third', name: 'Betty')
    Peep.create(peep: 'second', name: 'Shirley')
    visit '/'
    click_on('Sign up')
    fill_in('name', with: 'Barry')
    fill_in('email', with: 'test@testing.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
    fill_in('newpeep', with: "")
    fill_in('newpeep', with: "first")
    click_on('Submit')
    expect('first').to appear_before('second')
    expect('third').to appear_before('last')
  end
end
