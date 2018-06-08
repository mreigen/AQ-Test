class AddScoreColumnToBillboards < ActiveRecord::Migration[5.0]
  def change
    add_column :billboards, :score, :float, default: 0.0
  end
end
