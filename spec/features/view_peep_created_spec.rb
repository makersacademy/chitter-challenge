# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'created time visible on a peep' do
  scenario 'each peep has a created time ' do
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
    click_button('Peep')

    expect(page).to have_content(Time.new.year)
    expect(page).to have_content(Time.new.hour)

  
  end
end