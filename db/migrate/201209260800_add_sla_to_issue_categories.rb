class AddSlaToIssueCategories < ActiveRecord::Migration[4.2]
  def change
    add_column :issue_categories, :sla_default, :integer, :default => 0
    add_column :issue_categories, :sla_vip,     :integer, :default => 0
  end
end
