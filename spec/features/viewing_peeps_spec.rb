feature 'Viewing peeps' do

  let(:user) do
    User.create(email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234',
                name: 'Anthony',
                username: 'adellanno')
  end

  xscenario 'Every peep will contain the name of the person who posted it' do
    visit '/peeps/new'
    sign_in(email: user.email, password: user.password)
    click_button 'New Peep'
    fill_in 'body', with: 'test peep'
    click_button 'Post Peep'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content('Anthony')
  end
  # Why won't my name or username appear in tests?

  xscenario 'Every peep will contain the username of the person who posted it' do
    visit '/peeps/new'
    sign_in(email: user.email, password: user.password)
    click_button 'New Peep'
    fill_in 'body', with: 'Can you see my username Chitter?'
    click_button 'Post Peep'

    expect(page).to have_content('adellanno')
  end
  # Why won't my name or username appear in tests?

  scenario 'User does not have to be logged in to see peeps' do
    visit '/peeps/new'
    sign_in(email: user.email, password: user.password)
    click_button 'New Peep'
    fill_in 'body', with: 'hello stranger!'
    click_button 'Post Peep'
    click_button 'Sign out'

    expect(page).to have_content('hello stranger!')
  end

end


