# ## Schema Information
#
# Table name: `applications`
#
# ### Columns
#
# Name               | Type               | Attributes
# ------------------ | ------------------ | ---------------------------
# **`id`**           | `integer`          | `not null, primary key`
# **`name`**         | `string(39)`       | `not null`
# **`description`**  | `text`             |
# **`created_at`**   | `datetime`         | `not null`
# **`updated_at`**   | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_applications_on_name` (_unique_):
#     * **`name`**
#

FactoryGirl.define do
  factory :application do
    name "MyString"
    description "MyText"
  end
end
