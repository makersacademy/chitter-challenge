feature 'log in' do
  scenario 'user can log in' do
    sign_up
    visit '/sessions/new'
  end
end
