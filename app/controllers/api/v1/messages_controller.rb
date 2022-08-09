class Api::V1::MessagesController < ApplicationController
  # protect_from_forgery with: :null_session

  def index
    messages = Message.all

    render json: messages
  end

  def show
    message = Message.find(rand(Message.first.id..Message.last.id))

    render json: message
  end

  def create
    message = Message.new(message_params)

    if message.save
      render json: message, status: :created
    else
      render json: { error: message.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :greeting)
  end
end
