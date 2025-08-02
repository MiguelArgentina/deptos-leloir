# == Schema Information
#
# Table name: apartments
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  location      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  contact_name  :string
#  contact_phone :string
#  contact_email :string
#

class Apartment < ApplicationRecord
  has_many_attached :photos

  validates :title, presence: true
end
