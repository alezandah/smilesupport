class DashboardController < ApplicationController


  def home
    render layout: 'dashboard'
  end

  def tickets
  @tickets = Ticket.all
  end

  def reports
    render layout: 'dashboard'
  end

  def settings
    render layout: 'dashboard'
  end

  def help
    render layout: 'dashboard'
  end

  def login
    render layout:  'login'
  end
end
