class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_employee!, only: [:index, :show, :edit, :update, :destroy]

  layout 'default'

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    
    if @job.save
      current_user.jobs << @job
      respond_to do |format|
        format.html { redirect_to dashboard_url, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    def authenticate_owner_or_employee!
        if @job.user != current_user && !current_user.employee?
            redirect_to dashboard_url, notice: 'You do not have ownership over this order.'
        end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description, :progress, :status)
    end
end
