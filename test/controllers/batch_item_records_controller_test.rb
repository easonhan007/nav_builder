require "test_helper"

class BatchItemRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @batch_item_record = batch_item_records(:one)
  end

  test "should get index" do
    get batch_item_records_url
    assert_response :success
  end

  test "should get new" do
    get new_batch_item_record_url
    assert_response :success
  end

  test "should create batch_item_record" do
    assert_difference("BatchItemRecord.count") do
      post batch_item_records_url, params: { batch_item_record: { content: @batch_item_record.content, section_id: @batch_item_record.section_id } }
    end

    assert_redirected_to batch_item_record_url(BatchItemRecord.last)
  end

  test "should show batch_item_record" do
    get batch_item_record_url(@batch_item_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_batch_item_record_url(@batch_item_record)
    assert_response :success
  end

  test "should update batch_item_record" do
    patch batch_item_record_url(@batch_item_record), params: { batch_item_record: { content: @batch_item_record.content, section_id: @batch_item_record.section_id } }
    assert_redirected_to batch_item_record_url(@batch_item_record)
  end

  test "should destroy batch_item_record" do
    assert_difference("BatchItemRecord.count", -1) do
      delete batch_item_record_url(@batch_item_record)
    end

    assert_redirected_to batch_item_records_url
  end
end
