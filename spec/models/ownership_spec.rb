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

require 'rails_helper'

RSpec.describe Ownership, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
