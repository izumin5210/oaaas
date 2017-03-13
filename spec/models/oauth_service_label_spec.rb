# ## Schema Information
#
# Table name: `oauth_service_labels`
#
# ### Columns
#
# Name                  | Type               | Attributes
# --------------------- | ------------------ | ---------------------------
# **`id`**              | `integer`          | `not null, primary key`
# **`name`**            | `string`           | `not null`
# **`created_at`**      | `datetime`         | `not null`
# **`updated_at`**      | `datetime`         | `not null`
# **`application_id`**  | `integer`          | `not null`
#
# ### Indexes
#
# * `index_oauth_service_labels_on_application_id`:
#     * **`application_id`**
# * `index_oauth_service_labels_on_name`:
#     * **`name`**
#

require 'rails_helper'

RSpec.describe OauthServiceLabel, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
