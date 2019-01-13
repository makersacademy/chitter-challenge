class CreatePeeps < ActiveRecord::Migration[5.2]
  def change
    create_table(:peeps) do |p|
      p.belongs_to :user, index: true
      p.column(:title, :string)
      p.column(:content, :string)
      p.column(:user_id, :integer)
      p.column(:created_at, :datetime)
    end
  end
end
