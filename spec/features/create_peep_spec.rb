require 'sinatra'

feature 'Create peep' do
  scenario 'user can create peep and see it in feed' do
    visit '/'
    fill_in 'username', with: 'test1'
    fill_in 'password', with: 'test1password'
    click_on 'Log In'

    expect(current_path).to eq '/chitter/account/test1'
    
    fill_in 'peep_body', with: "My first peep!"
    click_on 'Peep'

    expect(page).to have_content('Test One')
    expect(page).to have_content('test1')
    expect(page).to have_content('My first peep!')
    expect(page).to have_content(Time.now.strftime("%k:%M %-d %b %y"))
  end
end
