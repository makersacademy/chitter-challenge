feature 'Create a peep' do
  @message1 = 'Hello World, this is my peep!'
  @message2 = 'Hi, this is my second peep!'

  before(:each) do
    visit('/user/new')
    expect(page.status_code).to eq(200)
    fill_in 'email',     with: 'rob@gmail.com'
    fill_in 'password',  with: 'mypassword'
    fill_in 'name',      with: 'Robert'
    fill_in 'user_name', with: 'Rob'
    click_on('Sign up')
    visit('/home')
    fill_in 'new_peep_box', with: @message1
    click_on('Create Peep')
    visit('/home')
    fill_in 'new_peep_box', with: @message2
    click_on('Create Peep')
  end

  scenario 'User can post a peep to chitter' do
    expect(page.status_code).to eq 200
    expect(page).to have_content(@message1)
  end

  scenario 'Peeps appear in reverse chronological order' do
    fill_in 'new_peep_box', with: 'one'
    click_on('Create Peep')
    fill_in 'new_peep_box', with: 'two'
    click_on('Create Peep')
    expect('two').to appear_before('one')
  end

  scenario 'Peeps appear with time of peep' do
    expect(page).to have_content(Time.now.strftime(" %I:%M %p "))
  end

  scenario 'Peeps appears with date of peep' do
    expect(page).to have_content(Time.now.strftime(" %d-%b-%Y "))
  end

  scenario 'Peep appears with User Name' do
    expect(page).to have_content("Rob: #{@message1}")
  end
end
