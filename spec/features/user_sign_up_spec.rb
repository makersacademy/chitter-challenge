feature 'Sign up user' do
  scenario 'it should login with a user name' do
    allow_any_instance_of(Message).to receive(:created_at).and_return('12:25')
    login_in_and_peep
    expect(page).to have_content('Pikachu - 12:25')
  end
end
