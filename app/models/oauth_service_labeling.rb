# ## Schema Information
#
# Table name: `oauth_service_labelings`
#
# ### Columns
#
# Name                          | Type               | Attributes
# ----------------------------- | ------------------ | ---------------------------
# **`id`**                      | `integer`          | `not null, primary key`
# **`oauth_service_id`**        | `integer`          | `not null`
# **`oauth_service_label_id`**  | `integer`          | `not null`
# **`created_at`**              | `datetime`         | `not null`
# **`updated_at`**              | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_oauth_service_labelings_on_oauth_service_id`:
#     * **`oauth_service_id`**
# * `index_oauth_service_labelings_on_oauth_service_label_id`:
#     * **`oauth_service_label_id`**
#

class OauthServiceLabeling < ApplicationRecord
  belongs_to :oauth_service, required: true
  belongs_to :oauth_service_label, required: true
end
