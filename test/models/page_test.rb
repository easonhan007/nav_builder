# == Schema Information
#
# Table name: pages
#
#  id               :integer          not null, primary key
#  title            :string
#  slug             :string
#  position         :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  need_persistence :boolean          default(TRUE)
#
require "test_helper"

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
