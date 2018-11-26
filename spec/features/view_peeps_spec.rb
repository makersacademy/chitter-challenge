feature 'view peeps' do

  let(:user_info) { { 'first_name' => 'abdi', 'last_name' => 'abdi','email' => 'abdi2@gmail.com', 'password' => 'password123'} }

  scenario 'view peeps in reverse chronological order' do
    login(user_info)
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
    login(user_info)
    peep = create_peeps(user_info)

    expect(page).to have_content(peep[0]['creation_time'])
  end
  
  scenario 'view peeps belonging to my user account' do

    visit('/')

    expect(page).not_to have_content('one')
    expect(page).not_to have_content('two')
    expect(page).not_to have_content('three')

    login(user_info)
    create_peeps(user_info)

    expect(page).to have_content('one')
    expect(page).to have_content('two')
    expect(page).to have_content('three')
    
  end
end
