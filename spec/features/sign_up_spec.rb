feature 'sign up experience' do
  scenario 'user enters necessary details' do
    sign_up
    expect(current_path).to eq '/chitter-newsfeed'
    expect(page).to have_content 'Welcome, Alexander Dominic Chalk'
  end
end
