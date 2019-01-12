class CreatePeeps < ActiveRecord::Migration[5.2]
  def change
    create_table(:peeps) do |p|
      p.column(:title, :string)
      p.column(:content, :string)
      p.column(:user_id, :integer)
      p.timestamps()
      
    end
  end
end
