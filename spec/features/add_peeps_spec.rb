
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
    p User.get(peep.user_id).username
    expect(peep.message).to eq('This is a new peep!')
  end

  scenario 'As a non-user I cannot add a peep' do
    visit '/peeps/new'
    expect(page).to have_content 'Please login in order to create a Peep'
  end

  scenario 'I would like my name to be added to my peeps' do
    user = create :user
    peep = create :peep
    sign_in_as(user)
    visit '/peeps/new'
    fill_in 'message', with: 'This is a new peep!'
    click_button 'Peep'
    visit('/peeps')
    expect(page).to have_content('Peeped by pip at Sun, 27 Sep 2015 14:19:10.000000000 +0100')
  end

  scenario 'I would like my peep to be dated' do
    user = create :user
    peep = create :peep
    peep.created_at = '2015-09-26 20:08:30'
    sign_in_as(user)
    p peep
    peep_now(peep)
    peep = Peep.first
    expect(peep.created_at).to eq('Sun, 27 Sep 2015 20:08:30.000000000 +0100')
  end

end


def sign_in_as(user)
  visit '/sessions/new'
  fill_in :email,    with: user.email
  fill_in :password, with: user.password
  click_button 'Sign in'
end

def peep_now(peep)
  visit '/peeps/new'
  fill_in :message, with: peep.message
  peep.created_at = '2015-09-26 20:08:30'
  click_button 'Peep'
end
