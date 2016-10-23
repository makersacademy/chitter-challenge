feature 'Creating peeps' do

  scenario 'The user can create a new peep' do
    visit '/'
    sign_up
    expect(current_path).to eq '/new_user'
    expect(page).to have_content('Post new peep!')
    end
  end
