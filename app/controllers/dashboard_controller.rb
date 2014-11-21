class DashboardController < ApplicationController

  helper  ApplicationHelper

  layout "dashboard"

  def home
  @tickets = Ticket.all
  end

  def tickets
  @tickets = Ticket.all
  @tickets = Ticket.page(params[:page]).per(5)
  end

  def reports

  end

  def edit
    @ticket = Ticket.find(params[:id])
    @assignees = Assignee.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to dashboard_path, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def settings
  end

  def help
  end

  def login
    render layout:  'login'
  end

  private
  def ticket_params
    params.require(:ticket).permit(:title, :description, :assignee, :priority, :status, :assignee_id)
  end
end
