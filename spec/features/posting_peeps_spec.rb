feature 'posting peeps' do
  scenario 'user submits a peep to be posted' do 
    visit '/chitter/new_peep'
    fill_in 'message', with: "I'm peeping!"
    click_on 'Submit'

    expect(current_path).to eq '/chitter'
    expect(page).to have_content "I'm peeping!"
  end
end
