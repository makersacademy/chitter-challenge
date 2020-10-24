feature 'Homepage' do
  scenario 'Welcomes the user with a title' do
    visit '/'
    expect(page).to have_content('Welcome to Chitter')
  end

end