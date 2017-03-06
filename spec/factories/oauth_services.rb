# ## Schema Information
#
# Table name: `oauth_services`
#
# ### Columns
#
# Name                   | Type               | Attributes
# ---------------------- | ------------------ | ---------------------------
# **`id`**               | `integer`          | `not null, primary key`
# **`consumer_key`**     | `string`           | `not null`
# **`consumer_secret`**  | `string`           | `not null`
# **`scope`**            | `string`           |
# **`provider`**         | `string`           | `not null`
# **`application_id`**   | `integer`          | `not null`
# **`created_at`**       | `datetime`         | `not null`
# **`updated_at`**       | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_oauth_services_on_application_id`:
#     * **`application_id`**
#

FactoryGirl.define do
  factory :oauth_service do
    consumer_key "MyString"
    consumer_secret "MyString"
    scope "MyString"
    provider "MyString"
  end
end
