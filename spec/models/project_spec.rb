# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string
#  description :text
#  manager_id  :integer
#  client_id   :integer
#  public      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Project, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
