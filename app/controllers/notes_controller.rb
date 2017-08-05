class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
    render :form
  end

  def create
    @note = Note.new create_params
    if @note.save
      redirect_to child_path(@note.child)
    else
      render :form
    end
  end

  def show
  end

  def edit
    render :form
  end

  def update
    if @note.update update_params
      redirect_to child_path(@note.child)
    else
      render :form
    end
  end

  def destroy
    @note.destroy
    redirect_to child_path(@note.child)
  end

  private

  def create_params
    params.require(:note).permit(:child_id, :content)
  end

  def update_params
    params.require(:note).permit(:content)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
