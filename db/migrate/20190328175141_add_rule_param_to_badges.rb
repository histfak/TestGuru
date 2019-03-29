class AddRuleParamToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :rule_param, :string
  end
end
