feature 'Blank email confirmation' do
  scenario 'blank email raises error' do

    sign_up(email: '')

    expect(User.all.count).to eq 0
    expect(page).to have_content('Please enter an email address')

  end
end
