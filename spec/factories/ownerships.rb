# ## Schema Information
#
# Table name: `ownerships`
#
# ### Columns
#
# Name                  | Type               | Attributes
# --------------------- | ------------------ | ---------------------------
# **`id`**              | `integer`          | `not null, primary key`
# **`ownable_type`**    | `string`           | `not null`
# **`ownable_id`**      | `integer`          | `not null`
# **`application_id`**  | `integer`          | `not null`
# **`created_at`**      | `datetime`         | `not null`
# **`updated_at`**      | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_ownerships_on_application_id`:
#     * **`application_id`**
# * `index_ownerships_on_ownable_type_and_ownable_id`:
#     * **`ownable_type`**
#     * **`ownable_id`**
#

FactoryGirl.define do
  factory :ownership do
    ownable nil
    application nil
  end
end
