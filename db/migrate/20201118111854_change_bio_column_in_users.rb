class ChangeBioColumnInUsers < ActiveRecord::Migration[6.0]
  def change
    def change
      change_column :users, :bio, :text
    end
  end
end
