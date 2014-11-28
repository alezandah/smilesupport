class DashboardController < ApplicationController
  before_action :authenticate

  helper  ApplicationHelper

  layout "dashboard"

  def home
  end

  def user
    # render layout: "application"
  end


  def tickets
  # @ticket = Ticket.all
  @tickets = current_user.tickets.page(params[:page])
  end

  def pending
    @tickets = current_user.tickets.page(params[:page])
  end

  def assigned
    @tickets = current_user.tickets.where(status: Ticket::ASSIGNED).page(params[:page])
  end

  def open
  @tickets = current_user.tickets.where(status: Ticket::OPEN).page(params[:page])
  end

  def resolved
    @tickets = current_user.tickets.where(status: Ticket::RESOLVED).page(params[:page])
  end

  def edit
    @ticket = current_user.tickets.find(params[:id])
  end

  def show
    @ticket = current_user.tickets.find(params[:id])
  end

  def level1
    @tickets = current_user.tickets.where(priority: Ticket::LEVEL_1).page(params[:page])
  end

  def level2
    @tickets = current_user.tickets.where(priority: Ticket::LEVEL_2).page(params[:page])
  end

  def level3
    @tickets = current_user.tickets.where(priority: Ticket::LEVEL_3).page(params[:page])
  end

  def update
    @ticket = current_user.tickets.find(params[:id])
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
    render layout: 'user'
  end

  private
  def ticket_params
    params.require(:ticket).permit(:title, :description, :assignee, :priority, :status, :assignee_id)
  end
  def authenticate
    authenticate_user! && current_user.admin?
  end
end
