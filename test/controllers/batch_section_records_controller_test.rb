require "test_helper"

class BatchSectionRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @batch_section_record = batch_section_records(:one)
  end

  test "should get index" do
    get batch_section_records_url
    assert_response :success
  end

  test "should get new" do
    get new_batch_section_record_url
    assert_response :success
  end

  test "should create batch_section_record" do
    assert_difference("BatchSectionRecord.count") do
      post batch_section_records_url, params: { batch_section_record: { content: @batch_section_record.content, log: @batch_section_record.log, page_id: @batch_section_record.page_id } }
    end

    assert_redirected_to batch_section_record_url(BatchSectionRecord.last)
  end

  test "should show batch_section_record" do
    get batch_section_record_url(@batch_section_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_batch_section_record_url(@batch_section_record)
    assert_response :success
  end

  test "should update batch_section_record" do
    patch batch_section_record_url(@batch_section_record), params: { batch_section_record: { content: @batch_section_record.content, log: @batch_section_record.log, page_id: @batch_section_record.page_id } }
    assert_redirected_to batch_section_record_url(@batch_section_record)
  end

  test "should destroy batch_section_record" do
    assert_difference("BatchSectionRecord.count", -1) do
      delete batch_section_record_url(@batch_section_record)
    end

    assert_redirected_to batch_section_records_url
  end
end
