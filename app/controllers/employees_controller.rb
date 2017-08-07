class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
    render :form
  end

  def create
    @employee = Employee.new create_params
    if @employee.save
      redirect_to employees_path
    else
      render :form
    end
  end

  def edit
    render :form
  end

  def update
    if @employee.update update_params
      redirect_to employees_path
    else
      render :form
    end
  end

  def destroy
    @employee.destroy
    redirect_to action: :index
  end

  private

  def create_params
    params.require(:employee).permit(
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

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
