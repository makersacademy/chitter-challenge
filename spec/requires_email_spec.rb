feature 'requires email' do
  scenario 'I need to enter in an email to proceed' do
    requires_email
    expect{requires_email}.to change{User.count}.by 0
  end
end
