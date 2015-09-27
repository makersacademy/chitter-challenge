
require './spec/factories/user'
require './spec/factories/peep'

feature 'Creating Peeps' do

  scenario 'As a user I can add a peep' do
    user = create :user
    sign_in_as(user)
    visit '/peeps/new'
    fill_in 'message', with: 'This is a new peep!'
    click_button 'Peep'
    peep = Peep.first
    expect(peep.message).to eq('This is a new peep!')
  end

  scenario 'As a non-user I cannot add a peep' do
    visit '/peeps/new'
    expect(page).to have_content 'Please login in order to create a Peep'
  end

  scenario 'I would like my name to be added to my peeps' do
    user = create :user
    sign_in_as(user)
    visit '/peeps/new'
    fill_in 'message', with: 'This is a new peep!'
    click_button 'Peep'
    peep = Peep.first
    expect(peep.message).to eq('Peeped by pip')
  end

  scenario 'I would like my peep to be dated' do
    user = create :user
    sign_in_as(user)
    visit '/peeps/new'
    fill_in 'message', with: 'This is a new peep!'
    click_button 'Peep'
    peep = Peep.first
    expect(peep.created_at).to eq('2015-09-26 20:08:30')
  end

end


def sign_in_as(user)
  visit '/sessions/new'
  fill_in :email,    with: user.email
  fill_in :password, with: user.password
  click_button 'Sign in'
end
