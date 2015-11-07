feature "Posting a peep" do

  def sign_up
    visit('/sign_up')
    fill_in('name', with: 'Alaan')
    fill_in('username', with: 'Alaanzr')
    fill_in('email', with: 'Alaanzr@gmail.com')
    fill_in('password', with: 'password')
    click_button('Register')
  end

  scenario "Submitting a new peep" do
    sign_up
    fill_in('peep', with: 'Good morning world!')
    click_button('Peep!')
    within('ul#peeps') do
        expect(page).to have_content('Good morning world!')
    end
  end
end
