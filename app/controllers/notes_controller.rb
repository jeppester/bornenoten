class NotesController < ApplicationController
  before_action :set_note, only: [:edit, :update, :destroy]
  before_action :set_child, only: [:new, :edit, :update]

  def new
    @note = Note.new
    @slug = [[@child.name, child_path(@child)], 'Ny note']
    render :form
  end

  def create
    @note = Note.new create_params

    if @note.save
      redirect_to child_path(@note.child)
    else
      @slug = [[@child.name, child_path(@child)], 'Ny note']
      render :form
    end
  end

  def edit
    @slug = [[@child.name, child_path(@child)], 'Redigér note']
    render :form
  end

  def update
    if @note.update update_params
      redirect_to child_path(@note.child)
    else
      @slug = [[@child.name, child_path(@child)], 'Redigér note']
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

  def set_child
    @child = Child.find(params[:child_id])
  end
end
