def sign_up
  click_button('sign up')
  fill_in 'name', with: 'Amit Tauro'
  fill_in 'username', with: 'artauro92'
  fill_in 'email', with: 'artauro92@hotmail.com'
  fill_in 'password', with: 'Makers'
  click_button 'submit'
end

describe 'sign up to Chitter', type: :feature do
  it 'allows a person to sign up to Chitter' do
    visit('/')
    sign_up
    expect(page).to have_content('Post a peep')
  end
end

describe 'post a peep to Chitter', type: :feature do
  it 'allows a person to post a peep to Chitter' do
    visit('/')
    sign_up
    fill_in 'message', with: 'my first peep'
    fill_in 'username', with: 'artauro92'
    fill_in 'email', with: 'artauro92@hotmail.com'
    click_button 'submit'
    expect(page).to have_content 'my first peep'
  end
end
