class Api::V1::JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_v1_job, only: %i[ show update destroy ]

  # GET /api/v1/jobs
  def index
    @api_v1_jobs = Api::V1::Job.all

    render json: @api_v1_jobs
  end

  # GET /api/v1/jobs/1
  def show
    render json: @api_v1_job
  end

  # POST /api/v1/jobs
  def create
    @api_v1_job = Api::V1::Job.new(api_v1_job_params)

    if @api_v1_job.save
      render json: @api_v1_job, status: :created, location: @api_v1_job
    else
      render json: @api_v1_job.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/jobs/1
  def update
    if @api_v1_job.update(api_v1_job_params)
      render json: @api_v1_job
    else
      render json: @api_v1_job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/jobs/1
  def destroy
    @api_v1_job.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_job
      @api_v1_job = Api::V1::Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_job_params
      params.require(:api_v1_job).permit(:title, :description, :expires_date, :company_id)
    end
end
