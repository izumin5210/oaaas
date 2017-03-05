# ## Schema Information
#
# Table name: `login_names`
#
# ### Columns
#
# Name      | Type               | Attributes
# --------- | ------------------ | ---------------------------
# **`id`**  | `string`           | `not null, primary key`
#

FactoryGirl.define do
  factory :login_name do
    name "MyString"
  end
end
