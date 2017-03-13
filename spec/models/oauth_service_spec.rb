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

require 'rails_helper'

RSpec.describe OauthService, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
