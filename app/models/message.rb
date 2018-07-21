class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
  
  #보람 
  after_create_commit { MessageBroadcastJob.perform_later(self) }
end
