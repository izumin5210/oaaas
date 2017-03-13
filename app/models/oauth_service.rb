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
# **`name`**             | `string`           | `not null`
#
# ### Indexes
#
# * `index_oauth_services_on_application_id`:
#     * **`application_id`**
#

class OauthService < ApplicationRecord
  belongs_to :application

  enum provider: Global.oauth_providers.to_hash.keys.map { |id, _| [id, id] }.to_h

  validates :consumer_key, presence: true
  validates :consumer_secret, presence: true
  validates :provider, presence: true
  validates :name, presence: true
end
