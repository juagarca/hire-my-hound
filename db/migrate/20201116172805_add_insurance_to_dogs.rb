class AddInsuranceToDogs < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :insurance, :boolean, :default => false
  end
end
