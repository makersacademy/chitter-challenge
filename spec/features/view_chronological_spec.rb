# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'peeps listed in reverse order (newest first' do
  scenario 'second peep appears before first' do

    visit('/')
    click_button('New User')
    fill_in('name', with: 'Jack')
    fill_in('username', with: 'JD')
    fill_in('email', with: 'jd@peep.com')
    fill_in('password', with: 'sshhhhh')
    click_button('Add Me')    
    click_button('Post Peep')
    fill_in('message', with: 'This is my first peep')
    click_button('Peep')

    visit('/')
    click_button('New User')
    fill_in('name', with: 'Mark')
    fill_in('username', with: 'MZ')
    fill_in('email', with: 'mz@smugbook.com')
    fill_in('password', with: 'secrets')
    click_button('Add Me')    
    click_button('Post Peep')
    fill_in('message', with: 'This is a smug peep')
    
    # a potential code smell
    sleep(1)

    click_button('Peep')

    peep1 = 'This is my first peep'
    peep2 = 'This is a smug peep'

    expect(page.body.index(peep1)).to be > page.body.index(peep2)

  end
end