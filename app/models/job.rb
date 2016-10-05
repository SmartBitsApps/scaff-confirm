# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  project_id  :integer
#  position_id :integer
#  quantity    :integer
#  alternates  :integer
#  manager_id  :integer
#  what_bring  :text
#  start_date  :string
#  end_date    :string
#  public      :boolean          default(FALSE)
#  status      :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Job < ActiveRecord::Base
  belongs_to :event
end
