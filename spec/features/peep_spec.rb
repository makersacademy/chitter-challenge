feature 'Create a peep' do
  before(:each) do
    visit('/user/new')
    expect(page.status_code).to eq(200)
    fill_in 'email',     with: 'rob@gmail.com'
    fill_in 'password',  with: 'mypassword'
    fill_in 'name',      with: 'Robert'
    fill_in 'user_name', with: 'Rob'
    click_on('Sign up')
  end

  scenario 'User can post a peep to chitter' do
    visit('/home')

    fill_in 'new_peep_box', with: 'Hello World, this is my peep!'
    click_on('Create Peep')

    expect(page.status_code).to eq 200
    expect(page).to have_content('Hello World, this is my peep!')
  end

  scenario 'Peeps appear in reverse chronological order' do
    visit('/home')
    message1 = 'Hello World, this is my peep!'
    message2 = 'Hi, this is my second peep!'

    fill_in 'new_peep_box', with: message1
    click_on('Create Peep')

    fill_in 'new_peep_box', with: 'Hi, this is my second peep!'
    click_on('Create Peep')

    expect(message2).to appear_before(message1)
  end

  scenario 'Peeps appear with time of peep' do
    visit('/home')
    message1 = 'Hello World, this is my peep!'
    message2 = 'Hi, this is my second peep!'

    fill_in 'new_peep_box', with: message1
    click_on('Create Peep')
    time = Time.now

    expect(page).to have_content(time.strftime(" %I:%M %p "))
  end

  scenario 'Peeps appear with date of peep' do
    visit('/home')
    message1 = 'Hello World, this is my peep!'
    message2 = 'Hi, this is my second peep!'

    fill_in 'new_peep_box', with: message1
    click_on('Create Peep')

    time = Time.now
    expect(page).to have_content(time.strftime(" %d-%b-%Y "))
  end
end
