feature 'Creating peeps' do

  let(:user) do
    User.create(name: 'Foo Bar',
                username: 'foobar',
                email: 'foo@bar.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'I can create a new peep' do
    # visit '/sessions/new'
    sign_in(email: 'foo@bar.com', password: 'secret1234')
    visit '/peeps/new'
    click_button 'Peep'
    fill_in 'Peep', with: 'This is a peep'
    click_button 'Peep'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('This is a peep')
    end
  end

  scenario 'There are no links in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end

  scenario 'I can only create a new peep if signed in' do
    visit '/peeps'
    fill_in 'peep', with: 'This is a peep'
    click_button 'Peep'
    expect(page).to have_content('You must sign in to peep')
  end

end
