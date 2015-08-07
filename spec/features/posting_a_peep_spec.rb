feature 'User posts a peep' do
  scenario 'of valid length when logged in' do
    user = create :user
    log_in user

    post_peep "My first peep!"

    expect(page).to have_content 'My first peep!'
  end

  xscenario 'cannot post overlong peep' do

  end

  xscenario 'cannot post when logged out' do

  end

  xscenario 'peeps are time-stamped' do

  end

  def post_peep content
    visit '/peeps/new'

    fill_in 'peep', with: content

    click_button 'Peep.'
    # peep = Peep.create(
    #   body: "My first peep!"
    # )
    # user.peeps << peep
  end

  def log_in user
    visit '/sessions/new'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'Log in'
  end
end
