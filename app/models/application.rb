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
#
# ### Indexes
#
# * `index_applications_on_name` (_unique_):
#     * **`name`**
#

class Application < ApplicationRecord
  has_one :ownership
  has_one :ownable, through: :ownership

  validates :name,
    presence: true,
    uniqueness: true,
    length: { maximum: 39 }
end
