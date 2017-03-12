feature 'Commenting on Peeps' do
  scenario 'I can comment on other\'s Peeps when logged in' do
    expect{comment}.to change(Comment, :count).by(1)
  end
  scenario 'I see comments on the homepage' do
    comment
    expect(current_path).to eq '/'
    expect(page).to have_content 'Hi Tifa!'
  end
end
