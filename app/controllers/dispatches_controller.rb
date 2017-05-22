class DispatchesController < ApplicationController
  before_action :set_dispatch, only: [:show, :edit, :update, :destroy]

  # GET /dispatches
  # GET /dispatches.json
  def index
    @dispatches = Dispatch.paginate(:page => params[:page]).order('updated_at DESC')
  end

  # GET /dispatches/1
  # GET /dispatches/1.json
  def show
    @comments = @dispatch.comments.all 
  end

  # GET /dispatches/new
  def new
    @dispatch = Dispatch.new
    @comment = @dispatch.comments.build
  end

  # GET /dispatches/1/edit
  def edit
  end

  # POST /dispatches
  # POST /dispatches.json
  def create
    @dispatch = Dispatch.new(dispatch_params)
    @dispatch.user_id = current_user.id
    respond_to do |format|
      if @dispatch.save
        format.html { redirect_to @dispatch, notice: 'Dispatch was successfully created.' }
        format.json { render :show, status: :created, location: @dispatch }
      else
        format.html { render :new }
        format.json { render json: @dispatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dispatches/1
  # PATCH/PUT /dispatches/1.json
  def update
    respond_to do |format|
      if @dispatch.update(dispatch_params)
        format.html { redirect_to @dispatch, notice: 'Dispatch was successfully updated.' }
        format.json { render :show, status: :ok, location: @dispatch }
      else
        format.html { render :edit }
        format.json { render json: @dispatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispatches/1
  # DELETE /dispatches/1.json
  def destroy
    @dispatch.destroy
    respond_to do |format|
      format.html { redirect_to dispatches_url, notice: 'Dispatch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_comment
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.dispatch_id = 12
    @comment.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispatch
      @dispatch = Dispatch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dispatch_params
      params.require(:dispatch).permit(:dps_number, :status, :user_id, :channel, comments_attributes: [:id, :body, :dispatch_id, :user_id])
    end

    def comment_params
      params.require(:comment).permit(:body, :dispatch_id, :user_id)
    end
end
