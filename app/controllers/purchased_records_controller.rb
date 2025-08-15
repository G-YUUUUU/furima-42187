class PurchasedRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @purchased_record_address = PurchasedRecordAddress.new
  end

  def create
    @purchased_record_address = PurchasedRecordAddress.new(purchased_record_params)
    if @purchased_record_address.valid?
      pay_item
      @purchased_record_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchased_record_params
    params.require(:purchased_record_address).permit(:postal_code, :prefecture_id, :municipality, :house_number,
                                                     :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_root
    item = Item.find(params[:item_id])
    return unless current_user.id == item.user_id || item.purchased_record.present?

    redirect_to root_path
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: @purchased_record_address.token,
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
