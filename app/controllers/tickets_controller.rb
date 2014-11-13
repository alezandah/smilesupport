class TicketsController < ApplicationController
  def new
    @ticket = SupportTicket.new
  end

  def create
    @ticket = SupportTicket.new(ticket_params)
    if @ticket.save
      redirect_to root_path, notice: 'Ticket created successfully'
    else
      render action: 'new'
    end
  end

  def show
  end

  private
  def ticket_params
    params.require(:support_ticket).permit(:title, :description)
  end
end
