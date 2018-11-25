require_relative './web_helpers.rb'

feature 'posting and viewing peeps' do
  scenario 'a user can sign up to chitter and post a peep' do
    sign_in_and_sign_up
    click_button 'Add Peep'
    expect(current_path).to eq "/peeps/new"
    fill_in 'message', with: 'This is a test peep'
    click_button 'Submit'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "This is a test peep posted by my_username"
  end

  scenario 'peeps show in reverse chronological order' do
    allow(Time).to receive(:now).and_return(Time.now)
    sign_in_and_sign_up
    click_button 'Add Peep'
    expect(current_path).to eq "/peeps/new"
    fill_in 'message', with: 'blah blah blah'
    click_button 'Submit'
    expect(current_path).to eq '/peeps'
    allow(Time).to receive(:now).and_return(Time.now + 10)
    click_button 'Add Peep'
    expect(current_path).to eq "/peeps/new"
    fill_in 'message', with: 'later peep'
    click_button 'Submit'
    expect(current_path).to eq '/peeps'
    expect(first('.peep')).to have_content 'later peep'
    expect(first('.peep')).not_to have_content 'blah blah blah'
  end
end
