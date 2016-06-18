#As a Maker
#So that I can post messages on Chitter as me
#I want to sign up for Chitter

feature 'Signup' do
  let(:random_username) { ['and', 'andy'].sample }

  scenario 'A user can sign up, their name is displayed on the landing page' do
    visit '/'
    click_button 'Sign Up'

    fill_in 'username', with:  random_username
    fill_in 'email',    with: 'and@me.com'
    fill_in 'password', with: 'monkey'
    fill_in 'name',     with: 'Andrea'
    fill_in 'surname',  with: 'Mazzarella'
    click_button 'Sign Up'

    expect(page).to have_content(random_username)
  end
end
