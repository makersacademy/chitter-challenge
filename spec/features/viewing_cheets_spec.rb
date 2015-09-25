require 'spec_helper'

feature 'Viewing cheets' do

  let(:user) { User.create(email: 'some@email.com', username: 'someone', password: '1', password_confirmation: '1') }
	
  scenario 'I can see my cheets on the cheets page' do
  	user.cheets.create(message: 'Something I want to let the Chitter World know.', time: DateTime.now)
  	visit '/cheets'
  	expect(page.status_code).to eq 200
  	expect(page).to have_content('Something I want to let the Chitter World know.')
  end

  scenario 'I can create a new cheet' do
    visit '/sessions/new'
    fill_in 'email', with: user.email
    fill_in 'password', with: '1'
    click_button 'Sign in'
    
  	visit '/cheets/new'
  	fill_in 'message', with: 'Something I have to say.'
  	click_button 'Post Cheet'
  	expect(current_path).to eq '/cheets'
  	within 'ul#cheets' do
  		expect(page).to have_content('Something I have to say')
  	end
  end

  scenario 'There are no cheets in the database at the start of the test' do
  	expect(Cheet.count).to eq 0
  end
end
