feature 'user can sign into account' do
  scenario 'so that user can post, they can sign into their account' do
    visit '/'
    click_button 'Sign Into Your Account'

    expect(page).to have_button 'Sign In'
  end
end
