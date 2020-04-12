feature 'Sending a Peep' do
  scenario 'compose peep button not present when user not signed in' do
    visit '/'

    expect(page).to_not have_content 'Compose Peep'
  end

  scenario 'signed in user can send a peep and see it back on the homepage' do
    dave_sign_up
    
    click_on 'Compose Peep'
    fill_in 'content', with: 'This is a test peep'
    click_on 'Peep'

    expect(current_path).to eq '/'
    expect(page).to have_content 'This is a test peep'
  end
end
