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

class Client < ActiveRecord::Base
  belongs_to :user
  has_many :projects
  
  validates_presence_of :company_name #, :phone_number, :email, :contact_person_name, :contact_phone #:vat_id
  validates_uniqueness_of :company_name
  validates_inclusion_of :public, :in => [true, false]
end
