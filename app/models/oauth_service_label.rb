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

class OauthServiceLabel < ApplicationRecord
  has_many :labelings, class_name: OauthServiceLabeling.name
  has_many :services, through: :labelings,
    source: :oauth_service, class_name: OauthService.name

  validates :name, presence: true
end
