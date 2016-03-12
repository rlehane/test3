class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :set_job



  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit


  # POST /notes
  def create

    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.job_id = @job.id

    if @note.save
      redirect_to @job
    end
  end

  # PATCH/PUT /notes/1
  # def update
  #   if @note.update(note_params)
  #     redirect_to @note, notice: 'Note was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # # DELETE /notes/1
  # def destroy
  #   @note.destroy
  #   redirect_to notes_url, notice: 'Note was successfully destroyed.'
  # end


  def edit
    @note = Note.find(params[:id])
  end

  def update
   @note = Note.find(params[:id])
  @job = @note.job

        if @note.update(params[:note].permit(:note))
      redirect_to job_path(@job)
    else
      render 'edit'
    end
  end


  def destroy
        @note = Note.find(params[:id])
        @job = Job.find(params[:job_id])
        @note.destroy
           redirect_to job_path(@job) 
        end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    def set_job
      @job = Job.find(params[:job_id])
    end

    # Only allow a trusted parameter "white list" through.
    def note_params
      params.require(:note).permit(:comment, :user_id)
    end
end
