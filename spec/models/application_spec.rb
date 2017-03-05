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
# **`owner_type`**   | `string`           | `not null`
# **`owner_id`**     | `integer`          | `not null`
#
# ### Indexes
#
# * `index_applications_on_name` (_unique_):
#     * **`name`**
# * `index_applications_on_owner_type_and_owner_id`:
#     * **`owner_type`**
#     * **`owner_id`**
#

require 'rails_helper'

RSpec.describe Application, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
