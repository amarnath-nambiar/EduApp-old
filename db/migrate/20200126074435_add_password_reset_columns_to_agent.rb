class AddPasswordResetColumnsToAgent < ActiveRecord::Migration[5.2]
  def change
    add_column :agents, :reset_password_token, :string
    add_column :agents, :reset_password_sent_at, :datetime
  end
end
