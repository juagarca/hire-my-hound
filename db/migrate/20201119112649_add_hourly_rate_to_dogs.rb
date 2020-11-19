class AddHourlyRateToDogs < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :hourly_rate, :float
  end
end
