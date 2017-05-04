require "pry"
class PurchaseOrdersController < ApplicationController
	before_action :set_purchase_order, only: [:update]
	def update
		@purchase_order.status = true;
		@purchase_order.save
		redirect_to :back
	end
	private
	def set_purchase_order
		binding.pry
        @purchase_order=PurchaseOrder.find(params[:id])
    end
	def purchase_order_params
      params.require(:purchase_order).permit(:status)
    end
end
