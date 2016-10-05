# == Schema Information
#
# Table name: positions
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  requirements :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Position, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
