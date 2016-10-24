# == Schema Information
#
# Table name: clients
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  company_name        :string
#  name                :string
#  email               :string
#  phone_number        :string
#  vat_id              :string
#  contact_person_name :string
#  contact_phone       :string
#  public              :boolean          default(FALSE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe Client, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
