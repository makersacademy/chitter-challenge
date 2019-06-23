RSpec.feature 'Registration Process' do
  matcher :be_success_page do
    match_unless_raises do |page|
      expect(page).to have_current_path "/user_success"
    end
  end

  scenario 'navigating from Welcome' do
    visit '/'
    click_link('Sign up for Chitter to Peep')
    expect(page).to have_content('Complete the Chitter signup form and start PEEPIN')
    expect(page).to have_field('username')
    expect(page).to have_button('Start Peeping')
  end

  scenario 'directly navigating' do
    visit '/register'
    expect(page).to have_content('Complete the Chitter signup form and start PEEPIN')
    expect(page).to have_field('username')
    expect(page).to have_button('Start Peeping')
  end

  scenario 'submit name and see success screen' do
    
    visit '/register'
    fill_in('username', with: 'Peeper')
    find_button('Start Peeping').click
    p "STEP ONE EXECUTES"
    expect(page).to be_success_page
    expect(page).to have_content('Peeper Success!')
    p "STEP TWO EXECUTES"
    expect(page).to have_link('Go to Peeps', href: '/peeps')
    p "STEP THREE EXECUTES"
  end
end
