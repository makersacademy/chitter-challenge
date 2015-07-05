feature 'Viewing peeps' do
  
  scenario 'can view peeps' do
    Peep.create(message: 'Hello, world')
    visit '/peeps'
    expect(page).to have_content('Hello, world')
  end

  scenario 'peeps contain time created' do
    time = Time.new(2015,7,5,15,25,0, "+01:00")
    Peep.create(message: 'Hello, world', time: time)
    visit '/peeps'
    expect(page).to have_content('15:25 5/7/2015')
  end

  scenario 'peeps contain username' do
    user = build :user
    sign_up_as(user)
    sign_in(user)
    visit '/peeps/new'
    fill_in 'peep', with: 'Hello, world'
    click_button 'Post peep'
    expect(page).to have_content('Author: Natso')
  end

  scenario 'peeps contain name' do
    user = build :user
    sign_up_as(user)
    sign_in(user)
    visit '/peeps/new'
    fill_in 'peep', with: 'Hello, world'
    click_button 'Post peep'
    expect(page).to have_content('(Natalie)')
  end
end