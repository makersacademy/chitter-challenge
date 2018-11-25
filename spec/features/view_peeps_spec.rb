feature 'view peeps' do

  let(:user_info) { {'first_name' => 'abdi', 'last_name' => 'abdi','email' => 'abdi2@gmail.com', 'password' => 'password123'} }

  scenario 'view peeps' do
    Peep.create(description: 'test information')
    visit('/')
    expect(page).to have_content('test information')
  end

  scenario 'view peeps in reverse chronological order' do
    Peep.create(description: 'one')
    Peep.create(description: 'two')
    Peep.create(description: 'three')
    visit('/')
    expect(page.find('li', match: :first)).to have_content 'three'
  end

  scenario 'view time the peep was made' do
    peep = Peep.create(description: 'one')
    Peep.create(description: 'two')
    Peep.create(description: 'three')
    visit('/')
    
    expect(page).to have_content(peep[0]['creation_time'])
  end
  
  scenario 'view peeps belonging to my user account' do
    peep = Peep.create(description: 'one')
    Peep.create(description: 'two')
    Peep.create(description: 'three')
    created_user = User.create(user_info)
    visit('/')

    expect(page).not_to have_content('one')
    expect(page).not_to have_content('two')
    expect(page).not_to have_content('three')

    visit('/login')
    fill_in('email', with: 'abdi2@gmail.com')
    fill_in('pwd', with: 'password123')
    click_button('login')

    expect(page).to have_content('one')
    expect(page).to have_content('two')
    expect(page).to have_content('three')
    
  end
end
