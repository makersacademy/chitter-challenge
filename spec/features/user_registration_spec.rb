feature 'registration' do

  scenario 'user can sign up for Chitter' do
    sign_up
    
    expect(page).to have_current_path('/peeps')
    expect(page).to have_content 'Welcome kbooks3'
  end
end