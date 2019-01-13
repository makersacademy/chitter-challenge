class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table(:users) do |u|
      u.column(:firstname, :string)
      u.column(:surname, :string)
      u.column(:email, :string)
      u.column(:password, :string)
    end
  end
end
