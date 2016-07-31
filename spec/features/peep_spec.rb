require './spec/spec_helper'
require './spec/web_helper'

feature 'Peeps' do
  let!(:user) do
    User.create(email: 'test@email.com', name: 'tester', user_name: 'testmiester',
      password: 'password', password_confirmation: 'password')
    end

  scenario 'User fills in peep' do
    sign_in(email: user.email, password: user.password)
    visit '/peeps'
    expect(page.status_code).to eq 200
    find_field('Your Peep').value
    expect(page).to have_button('Peep')
  end

  scenario 'User can peep when singed in' do
    sign_in(email: user.email, password: user.password)
    post_peep
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
       expect(page).to have_content('This is a Peep')
    end
  end

  scenario 'User cannot peep when not singed in' do
    expect{ post_peep }.not_to change(Peep, :count)
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
       expect(page).not_to have_content('This is a Peep')
    end
  end

end
