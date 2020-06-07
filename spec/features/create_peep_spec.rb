require 'sinatra'

feature 'Create peep' do
  scenario 'user can create peep and see it in feed' do
    visit '/'
    click_on 'Sign Up'

    expect(current_path).to eq '/chitter/account/new'
    fill_in 'full_name', with: 'Alex Smith'
    fill_in 'username', with: 'user234'
    fill_in 'email', with: 'user234@gmail.com'
    fill_in 'password', with: 'password123'
    click_on 'Sign Up'

    expect(current_path).to eq '/chitter/account/user234'
    
    fill_in 'peep_body', with: "My first peep!"
    click_on 'Peep'

    expect(current_path).to eq '/chitter/account/user234'
    expect(page).to have_content('Alex Smith')
    expect(page).to have_content('user234')
    expect(page).to have_content('My first peep!')
    expect(page).to have_content(Time.now.strftime("%k:%M %-d %b %y"))
  end
end
