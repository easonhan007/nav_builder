# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  link_name   :string
#  link_href   :string
#  description :string
#  position    :integer          default(0)
#  section_id  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
