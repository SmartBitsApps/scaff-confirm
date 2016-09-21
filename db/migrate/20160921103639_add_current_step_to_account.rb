class AddCurrentStepToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :current_step, :string
  end
end
