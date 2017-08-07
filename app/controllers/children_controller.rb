class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  def index
    @children = Child.all
  end

  def new
    @child = Child.new
    @slug = ['Nyt barn']
    render :form
  end

  def create
    @child = Child.new create_params
    if @child.save
      redirect_to @child
    else
      @slug = ['Nyt barn']
      render :form
    end
  end

  def show
    @slug = [@child.name]
  end

  def edit
    @slug = [[@child.name, child_path(@child)], 'Redigér']
    render :form
  end

  def update
    if @child.update update_params
      redirect_to @child
    else
      @slug = [[@child.name, child_path(@child)], 'Redigér']
      render :form
    end
  end

  def destroy
    @child.destroy
    redirect_to action: :index
  end

  private

  def create_params
    params.require(:child).permit(
      :name,
      :date_of_birth,
      :goals,
      :employee_id,
      :portrait,
      :remove_portrait,
      contacts_attributes: [:id, :name, :phone_number, :title]
    )
  end

  def update_params
    create_params
  end

  def set_child
    @child = Child.find(params[:id])
  end
end
