feature 'Creating a peep' do
  scenario 'want to be able to post a peep' do
    visit '/sign_up'
    fill_in :name, with: 'Fred'
    fill_in :email, with: 'fred@example.com'
    fill_in :username, with: 'FRED'
    fill_in :password, with: 'fred123'
    fill_in :password_confirmation, with: 'fred123'
    click_button 'submit'
    visit '/log_in'
    fill_in :email, with: 'fred@example.com'
    fill_in :password, with: 'fred123'
    visit '/chitters'
    fill_in 'message', with: 'Hello world'
    click_button 'Post peep'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Hello world'
  end
end
