feature 'Viewing peeps' do
  scenario 'peeps can be viewed' do
    user_sign_up_and_Peep_create_peep("hello")
    user_sign_up_and_Peep_create_peep("chitter")
    user_sign_up_and_Peep_create_peep("friends")

    visit '/peeps'

    expect(page).to have_content('hello')
    expect(page).to have_content('chitter')
    expect(page).to have_content('friends')
  end
end
