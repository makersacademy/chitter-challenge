
  feature 'Visit chitter' do
    scenario 'a user visits chitter' do
      visit '/'
      expect(page).to have_content("Welcome to Chitter!")
    end
  end
