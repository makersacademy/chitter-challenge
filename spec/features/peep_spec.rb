feature 'peep_spec: Peeping' do

  before(:each) do
    User.create(name: 'Shane',
                username: 'shane',
                email: 'test@test.com',
                password: 'test1234',
                password_confirmation: 'test1234')
  end

  scenario 'page has a place to add a peep' do
    sign_in(username: 'shane', password: 'test1234')
    expect(page).to have_button 'Peep'
  end

  scenario 'user can add a peep' do
    sign_in(username: 'shane', password: 'test1234')
    fill_in 'message', :with => 'Test peep. Keep peeping.'
    click_button 'Peep'
    within( 'ul#peeps' ) do
      expect(page).to have_content('Test peep. Keep peeping.')
    end
  end
end
