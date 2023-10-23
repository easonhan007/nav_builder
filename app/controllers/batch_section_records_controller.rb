class BatchSectionRecordsController < ApplicationController
  layout 'admin'
  before_action :set_batch_section_record, only: %i[ show edit update destroy ]

  # GET /batch_section_records or /batch_section_records.json
  def index
    @pagy, @batch_section_records = pagy BatchSectionRecord.order('created_at DESC')
  end

  # GET /batch_section_records/1 or /batch_section_records/1.json
  def show
  end

  # GET /batch_section_records/new
  def new
    @batch_section_record = BatchSectionRecord.new

    if params[:page_id]
      page = Page.find(params[:page_id])
      @batch_section_record.page = page
    end
  end

  # GET /batch_section_records/1/edit
  def edit
  end

  # POST /batch_section_records or /batch_section_records.json
  def create
    @batch_section_record = BatchSectionRecord.new(batch_section_record_params)

    respond_to do |format|
      if @batch_section_record.save
        format.html { redirect_to sections_url, notice: "Batch section record was successfully created." }
        format.json { render :show, status: :created, location: @batch_section_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @batch_section_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batch_section_records/1 or /batch_section_records/1.json
  def update
    respond_to do |format|
      if @batch_section_record.update(batch_section_record_params)
        format.html { redirect_to batch_section_record_url(@batch_section_record), notice: "Batch section record was successfully updated." }
        format.json { render :show, status: :ok, location: @batch_section_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch_section_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batch_section_records/1 or /batch_section_records/1.json
  def destroy
    @batch_section_record.destroy!

    respond_to do |format|
      format.html { redirect_to batch_section_records_url, notice: "Batch section record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch_section_record
      @batch_section_record = BatchSectionRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def batch_section_record_params
      params.require(:batch_section_record).permit(:page_id, :content, :log)
    end
end
