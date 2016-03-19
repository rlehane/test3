class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  # before_action :authenticate_user!, except: [:index, :show]
  # GET /jobs
skip_authorization_check

  def search
    if params[:search].present?
      @jobs = Job.search(params[:search])
    else
      @jobs = Job.all
    end
  end

  def index
    @jobs = Job.all

    if params[:category].blank?
      @jobs = Job.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @jobs = Job.where(category_id: @category_id).order("created_at DESC")
    end
  end

  # GET /jobs/1
  def show
    @notes = Note.where(job_id: @job.id).order("created_at DESC")
  end

  # GET /jobs/new
  def new
    @job = current_user.jobs.build
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  def create
    @job = current_user.jobs.build(job_params)

    if @job.save
      redirect_to @job, notice: 'Job was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.update(job_params)
      redirect_to @job, notice: 'Job was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
    redirect_to jobs_url, notice: 'Job was successfully destroyed.'
  end

  #for joining events
  def upvote
    @job.upvote_from current_user
    redirect_to @job, notice: 'Thanks for volunteering'
  end

  def downvote
    @job.downvote_from current_user
    redirect_to @job
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_params
      params.require(:job).permit(:title, :charity, :description, :date, :time, :no_vols, :location, :image, :category_id)
    end

end
