class CheckoutController < ApplicationController
    before_action :authorize
    def index
        if session[:current_user_id] == nil
            redirect_to '/login'
            return
        end
        @user = User.find_by(id: session[:current_user_id])
        render 'index'
    end


    def order
        req = 1
        @cart = Cart.create(user_id: session[:current_user_id])
        for i in 0..params[:shoppingCartItems].length.to_i-1
            DetailOfCart.create(cart_id: @cart.id, 
                                food_id: params[:shoppingCartItems][i.to_s][:id], 
                                quantity: params[:shoppingCartItems][i.to_s][:quantity], 
                                price: params[:shoppingCartItems][i.to_s][:price])
            PerchaseOrder.create(buyer: session[:current_user_id], 
                                food_id: params[:shoppingCartItems][i.to_s][:id],
                                quantity: params[:shoppingCartItems][i.to_s][:quantity],
                                seller_id: Food.find(params[:shoppingCartItems][i.to_s][:id]).user_id)
        end
        Shipping.create(cart_id: @cart.id, user_id:session[:current_user_id], name_receiver: params[:address][:name_receiver], phone_receiver: params[:address][:phone_receiver], address: params[:address][:address], status: 1)
        params[:shoppingCartItems]["0"][:id]
        render :json => req, :status => :ok

        rescue Exception => exc
            req = 0
            render :json => req, :status => :ok
    end
end
