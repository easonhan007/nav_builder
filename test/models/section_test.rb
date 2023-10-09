# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  title      :string
#  position   :integer          default(0)
#  page_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
