class AddSlaToIssueCategories < ActiveRecord::Migration
  def change
    add_column :issue_categories, :sla_default, :integer, :default => 0
    add_column :issue_Categories, :sla_vip,     :integer, :default => 0
  end
end
