feature 'posting peeps to chitter' do

  scenario 'a logged in user can create a new peep' do
    sign_up
    sign_in
    fill_in 'chit', with: 'This is a test "peep"!'
    click_on 'Chit It!'
    expect(page).to have_content('This is a test "peep"!')
  end

end
