feature "Creating a user" do
  scenario 'I can create a new user account' do
    expect { new_user }.to change(User, :count).by 1
    expect(page).to have_content "Welcome, Example1"
    expect(User.first.email).to eq 'example@example.com'
    expect(User.first.name).to eq 'Example Name'
    expect(User.first.username).to eq 'Example1'
  end
end
