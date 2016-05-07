require 'spec_helper'

feature 'Creating peeps' do
	let!(:user) do
    User.create(name: 'Ana mile', username: 'anamile', email: 'ana@mile.com',
      password: '123', password_confirmation: '123')
  end

  scenario 'user can create a new peep when logged in' do
    sign_in(email: 'ana@mile.com', password: '123')
    expect(current_path).to eq '/'
    fill_in 'peep', with: 'Hola que ase?'
    expect(page).to have_content('Hola que ase?')
  end
end