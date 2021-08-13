require 'timecop'
require 'web_helpers_spec'
feature 'Viewing chitter' do

  scenario 'A user can visit the homepage' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
    expect(page).to have_selector(:link_or_button, 'Send a peep')
  end

  scenario 'A user can send a peep' do
    send_a_peep
    expect(current_path).to eq '/home'
    expect(page).to have_content 'Hello, Chitter world!'
  end

  scenario 'A user can sign up to chitter' do
    sign_up_for_chitter
    expect(current_path).to eq '/home/:id'
    expect(page).to have_content "Welcome Henry Ford"
  end

  scenario 'A user can post messages via their account' do
    sign_up_for_chitter
    fill_in('enter_peep', with: 'It is a lovely day today')
    click_button 'Peep'
    expect(current_path).to eq '/home'
    expect(page).to have_content 'Posted by Henry ford'
  end
end