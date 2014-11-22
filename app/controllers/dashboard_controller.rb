class DashboardController < ApplicationController

  helper  ApplicationHelper

  layout "dashboard"

  def home
  @tickets = Ticket.all
  end

  def tickets
  @ticket = Ticket.all
  @tickets = Ticket.page(params[:page]).per(5)
  end

  def pending
    @ticket = Ticket.pending
    @tickets = Ticket.page(params[:page]).per(5)
  end

  def assigned
    @ticket = Ticket.where(status: Ticket::ASSIGNED)
    @tickets = Ticket.page(params[:page]).per(5)
  end

  def open
  @ticket = Ticket.where(status: Ticket::OPEN)
  @tickets = Ticket.page(params[:page]).per(5)
  end

  def resolved
    @ticket = Ticket.where(status: Ticket::RESOLVED)
    @tickets = Ticket.page(params[:page]).per(5)
  end

  def edit
    @ticket = Ticket.find(params[:id])
    @assignees = Assignee.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def level1
    @ticket = Ticket.where(priority: Ticket::LEVEL_1)
    @tickets = Ticket.page(params[:page]).per(5)
  end

  def level2
    @ticket = Ticket.where(priority: Ticket::LEVEL_2)
    @tickets = Ticket.page(params[:page]).per(5)
  end

  def level3
    @ticket = Ticket.where(priority: Ticket::LEVEL_3)
    @tickets = Ticket.page(params[:page]).per(5)
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
