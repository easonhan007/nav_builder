# == Schema Information
#
# Table name: batch_item_records
#
#  id         :integer          not null, primary key
#  section_id :integer          not null
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class BatchItemRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
