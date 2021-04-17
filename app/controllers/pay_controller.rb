class PayController < ApplicationController
    def create
        @user_id = params[:user_id]
        @amount = BigDecimal(params[:price]) * Integer(params[:quantity])

        @order = {'user_id' => @user_id, 'amount' => @amount}

        @order = Order.new(@order)
        @order.save()

        logger.debug "order info #{@order.id}"

        @order_description = {'order_id': @order.id, 'item_id': params[:item_id], 'quantity': params[:quantity]}

        @description = OrdersDescription.new(@order_description)
        @description.save()


        redirect_to root_path, notice: "Покупка успешна"
    end
end
