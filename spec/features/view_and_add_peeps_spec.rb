feature 'Homepage' do
  scenario 'Welcomes the user with a title' do
    visit '/'
    expect(page).to have_content('Welcome to Chitter')
  end

  feature 'Viewing Peeps' do
    scenario 'A user can see the peeps' do
      visit ('/peeps')
      expect(page).to have_content "I had a great day"
      expect(page).to have_content "I feel sad"
    end
  end

end