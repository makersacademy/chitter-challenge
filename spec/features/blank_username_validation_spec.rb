feature 'Blank username confirmation' do
  scenario 'blank username raises error' do

    sign_up(username: '')

    expect(User.all.count).to eq 0
    expect(page).to have_content('Please enter a username')

  end
end
