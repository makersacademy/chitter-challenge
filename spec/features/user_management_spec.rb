
feature 'User can sign up' do
  scenario 'John signs up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Welcome John!'
  end
end
