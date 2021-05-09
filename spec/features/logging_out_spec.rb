feature 'logging out' do
  scenario 'ends the user session' do
    sign_up_and_get_posting

    expect(page).to have_content 'Hello @test_name!'
    expect(page).not_to have_button 'Sign In'

    click_button 'Sign Out'

    expect(page).not_to have_content 'Hello @test!'
    expect(page).to have_button 'Sign In'
    expect(current_path).to eq '/posts'
    expect(page).to have_content 'You have signed out'
  end
end
