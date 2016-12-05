feature 'valid email format' do
  scenario 'I need to enter an email in a valid format to proceed' do
    expect{invalid_email_format}.to change{User.count}.by 0
  end
end
