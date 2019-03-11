class AddMembershipCountToCauses < ActiveRecord::Migration[5.1]
  def change
    add_column :causes, :memberships_count, :integer
  end
end
