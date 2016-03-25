feature 'duplicate user registration' do
  scenario 'Duplicate user registration' do

    sign_up
    sign_up

    expect(User.all.count).to eq 1
    expect(page).to have_content('This user already exists')
  end
end
