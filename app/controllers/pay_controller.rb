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

    def show
        @id = params[:id]

        @order = Order.find_by(id: @id)
        @order_description = OrdersDescription.find_by(order_id: @id)

        logger.debug "order info #{@order_description.inspect}"

        @item_id = @order_description.item_id

        @item = Item.find_by(id: @item_id)

        #logger.debug "order info #{@order_description}"
        #redirect_to root_path, notice: "Просмотр"
    end
end
