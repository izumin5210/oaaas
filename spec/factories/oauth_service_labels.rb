# ## Schema Information
#
# Table name: `oauth_service_labels`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`name`**        | `string`           | `not null`
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_oauth_service_labels_on_name`:
#     * **`name`**
#

FactoryGirl.define do
  factory :oauth_service_label do
    name "MyString"
  end
end
