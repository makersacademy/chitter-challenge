feature 'User posts a Roll' do

  scenario 'User fills out cheep and posts it' do
    visit '/rolls/new'
    fill_in('new_roll', with: email)
  end

end
