class BatchItemRecordsController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :set_batch_item_record, only: %i[ show edit update destroy ]

  # GET /batch_item_records or /batch_item_records.json
  def index
    @pagy, @batch_item_records = pagy BatchItemRecord.order('created_at DESC')
  end

  # GET /batch_item_records/1 or /batch_item_records/1.json
  def show
  end

  # GET /batch_item_records/new
  def new
    @batch_item_record = BatchItemRecord.new
    if params[:section_id]
      section = Section.find(params[:section_id])
      @batch_item_record.section = section
    end #if
  end

  # GET /batch_item_records/1/edit
  def edit
  end

  # POST /batch_item_records or /batch_item_records.json
  def create
    @batch_item_record = BatchItemRecord.new(batch_item_record_params)

    respond_to do |format|
      if @batch_item_record.save
        format.html { redirect_to batch_item_record_url(@batch_item_record), notice: "Batch item record was successfully created." }
        format.json { render :show, status: :created, location: @batch_item_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @batch_item_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batch_item_records/1 or /batch_item_records/1.json
  def update
    respond_to do |format|
      if @batch_item_record.update(batch_item_record_params)
        format.html { redirect_to batch_item_record_url(@batch_item_record), notice: "Batch item record was successfully updated." }
        format.json { render :show, status: :ok, location: @batch_item_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch_item_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batch_item_records/1 or /batch_item_records/1.json
  def destroy
    @batch_item_record.destroy!

    respond_to do |format|
      format.html { redirect_to batch_item_records_url, notice: "Batch item record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch_item_record
      @batch_item_record = BatchItemRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def batch_item_record_params
      params.require(:batch_item_record).permit(:section_id, :content)
    end
end
