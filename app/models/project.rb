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

class Project < ActiveRecord::Base
  belongs_to :user
end
