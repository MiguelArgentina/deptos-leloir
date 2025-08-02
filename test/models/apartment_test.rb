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

require "test_helper"

class ApartmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
