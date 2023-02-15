require "test_helper"

class Api::V1::JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_job = api_v1_jobs(:one)
  end

  test "should get index" do
    get api_v1_jobs_url, as: :json
    assert_response :success
  end

  test "should create api_v1_job" do
    assert_difference("Api::V1::Job.count") do
      post api_v1_jobs_url, params: { api_v1_job: { company_id: @api_v1_job.company_id, description: @api_v1_job.description, expires_date: @api_v1_job.expires_date, title: @api_v1_job.title } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_job" do
    get api_v1_job_url(@api_v1_job), as: :json
    assert_response :success
  end

  test "should update api_v1_job" do
    patch api_v1_job_url(@api_v1_job), params: { api_v1_job: { company_id: @api_v1_job.company_id, description: @api_v1_job.description, expires_date: @api_v1_job.expires_date, title: @api_v1_job.title } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_job" do
    assert_difference("Api::V1::Job.count", -1) do
      delete api_v1_job_url(@api_v1_job), as: :json
    end

    assert_response :no_content
  end
end
