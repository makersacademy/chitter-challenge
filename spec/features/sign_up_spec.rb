
feature "Sign up" do
  scenario "signs up and increases maker count by 1" do
    expect{sign_up}.to change(Maker, :count).by(1)
    expect(current_path).to eq('/sessions')
  end

end
