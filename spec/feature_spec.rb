feature 'Homepage' do

  scenario 'land on homepage' do
    DatabaseCleaner.clean
    sign_up_2_users
    bunch_of_peeps
    visit '/'
    expect(page).to have_content 'chitter'
  end

  scenario 'see peeps' do
    visit '/'
    expect(page).to have_content 'Name peeped:'
  end

  scenario 'see peeps' do
    visit '/'
    expect(page).to have_content 'practice peep'
  end

end
