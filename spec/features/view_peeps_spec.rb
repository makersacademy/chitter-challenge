feature 'view peeps' do

  let(:user_info) { { 'first_name' => 'abdi', 'last_name' => 'abdi','email' => 'abdi2@gmail.com', 'password' => 'password123'} }
  let (:created_user) { User.create(user_info) }

  scenario 'view peeps' do
    login
    Peep.create(description: 'test information', id: created_user.id )
    expect(page).to have_content('test information')
  end

  scenario 'view peeps in reverse chronological order' do
    login
    visit('/peeps')
    fill_in('peep', with: 'three')
    click_button('peep')
    fill_in('peep', with: 'two')
    click_button('peep')
    fill_in('peep', with: 'one')
    click_button('peep')
    expect(page.find('li', match: :first)).to have_content 'one'
  end

  scenario 'view time the peep was made' do
    login
    peep = create_peeps

    expect(page).to have_content(peep[0]['creation_time'])
  end
  
  scenario 'view peeps belonging to my user account' do

    visit('/')

    expect(page).not_to have_content('one')
    expect(page).not_to have_content('two')
    expect(page).not_to have_content('three')

    login
    create_peeps

    expect(page).to have_content('one')
    expect(page).to have_content('two')
    expect(page).to have_content('three')
    
  end
end
