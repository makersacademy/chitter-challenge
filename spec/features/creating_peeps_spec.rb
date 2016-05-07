require 'spec_helper'

feature 'Creating peeps' do
	let!(:user) do
    User.create(name: 'Ana mile', username: 'anamile', email: 'ana@mile.com',
      password: '123', password_confirmation: '123')
  end

  scenario 'user can create a new peep when logged in' do
    post_peep
    expect(current_path).to eq '/'
    expect(page).to have_content('Test')
  end

  scenario 'peeps are displayed in descendent chronological order' do
  	post_peep
    expect(current_path).to eq '/'
    expect(page).to have_content('Test')
  end
end