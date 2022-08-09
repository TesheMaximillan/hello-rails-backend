class Api::V1::MessagesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    messages = Message.all

    render json: MessageSerializer.new(messages).serialized_json
  end

  def show
    message = Message.find(rand(Message.first.id..Message.last.id))

    render json: MessageSerializer.new(message).serialized_json
  end

  def create
    message = Message.new(message_params)

    if message.save
      render json: MessageSerializer.new(message).serialized_json
    else
      render json: { error: message.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :greeting)
  end
end
