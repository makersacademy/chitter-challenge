feature 'registration' do
  scenario 'when I register, I want it to then tell me I am logged in' do
    register_frodo_swaggins
    expect(page).to have_content 'You are now signed in as FrodoSwaggins'
  end

  scenario 'when I register, if a username is taken I want it to tell me' do
    register_frodo_swaggins
    register_frodo_swaggins
    expect(page).to have_content 'that username is already taken'
  end
end
