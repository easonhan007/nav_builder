# == Schema Information
#
# Table name: batch_section_records
#
#  id         :integer          not null, primary key
#  page_id    :integer          not null
#  content    :text
#  log        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class BatchSectionRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
