feature 'Peeps' do

  scenario 'user can post peeps' do
    sign_in
    peep_hello_world
    expect(page).to have_content 'Hello world!'
  end

  scenario 'peeps appear in reverse chronological order' do
    sign_in
    peep_hello_world
    Peep.create(text: 'It is me', time_stamp: Time.now + 1, user_id: @user.id)
    visit '/' + @user.username
    expect(first 'li').to have_content 'It is me'
  end

  scenario 'peeps time stamp is attached' do
    sign_in
    peep_hello_world
    expect(page).to have_content Peep.first(user_id: @user.id).time_stamp.strftime('%b %e')
  end

  scenario 'peeps username is attached' do
    sign_in
    peep_hello_world
    expect(page).to have_content @user.username
  end

  scenario 'peeps name is attached' do
    sign_in
    peep_hello_world
    expect(page).to have_content @user.name
  end

  scenario 'if user is not logged in they can still view peeps' do
    sign_in
    peep_hello_world
    click_button 'Sign out'
    visit '/test_name'
    expect(page).to have_content 'Hello world!'
  end

  scenario 'if user is not logged in she cannot peep' do
    sign_in
    peep_hello_world
    click_button 'Sign out'
    visit '/test_name'
    expect(page).not_to have_selector 'form#peep'
  end

  scenario 'if user has not peeped their page should say so' do
    sign_in
    click_button 'Sign out'
    visit '/test_name'
    expect(page).to have_content 'User has not peeped yet'
  end

  scenario 'a peep is not added to the database if it is blank' do
    sign_in
    expect { click_button 'Peep' }.not_to change(User, :count)
  end

  scenario 'a peep is cannot be added if it is blank' do
    sign_in
    click_button 'Peep'
    expect(page).to have_content 'Cannot post a blank peep!'
  end

end
