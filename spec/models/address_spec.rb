# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  addressable_id   :integer
#  addressable_type :string
#  residence        :integer
#  street           :string
#  street_number    :string
#  city             :string
#  zip_code         :string
#  state            :string
#  status           :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
