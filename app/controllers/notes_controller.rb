class NotesController < ApplicationController
  before_action :set_note, only: [:edit, :update, :destroy]
  before_action :set_child, only: [:new, :edit]

  def new
    @note = Note.new
    @slug = [[@child.name, child_path(@child)], 'Ny note']
    @background_color = brand_color_light
    render :form
  end

  def create
    @note = Note.new create_params

    if @note.save
      redirect_to child_path(@note.child)
    else
      redirect_to child_path(@note.child)
    end
  end

  def edit
    @slug = [[@child.name, child_path(@child)], 'Redigér note']
    @background_color = brand_color_light
    render :form
  end

  def update
    if @note.update update_params
      redirect_to child_path(@note.child)
    else
      @note.destroy
      redirect_to child_path(@note.child)
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
