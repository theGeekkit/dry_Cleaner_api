class TicketsController < ApplicationController
    before_action :set_customer
    before_action :set_ticket, only: [:show]
  
    def index
      @tickets = @customer.tickets
      render json: @tickets
    end
  
    def show
      render json: @ticket
    end
  
    def create
      @ticket = @customer.tickets.new(ticket_params)
  
      if @ticket.save
        render json: @ticket, status: :created
      else
        render json: @ticket.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_customer
      @customer = Customer.find(params[:customer_id])
    end
  
    def set_ticket
      @ticket = @customer.tickets.find(params[:id])
    end
  
    def ticket_params
      params.require(:ticket).permit(:number)
    end
  end
  