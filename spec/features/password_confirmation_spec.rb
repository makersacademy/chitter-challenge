feature 'Passwords are checked thoroughly' do
  scenario 'Incorrect passwords do not produce new accounts' do
    expect { signs_up_with_mismatched_passwords }.to change { User.all.count }.by(0)
  end
end
