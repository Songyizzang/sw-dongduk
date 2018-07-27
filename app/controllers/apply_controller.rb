class ApplyController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  #지원서 체크
  def apply_toggle
    
    @post = Post.find(params[:post_id])
    apply = Apply.find_by(user_id: current_user.id, post_id: params[:post_id])
    #신청하기가 눌렸는지 체크
    if apply.nil?
      Apply.create(user_id: current_user.id, post_id: params[:post_id], matching: 'false')
      
      #신청서 왔다는 알람
      @new_notification = NewNotification.create! user: @post.user,
                                         content: "#{current_user.id}님이 신청서를 보냈습니다.",
                                         link: post_path(@post)
    else
      apply.destroy
    end
    
    @id = params[:post_id]
    
    redirect_to "/posts/#{@id}/"
    
  
 end
 
 def apply_accept
   @post = Post.find(params[:post_id])
   @apply = @post.applies.find(params[:apply_id])
   @apply.matching = "true"
   @apply.save
   
   
   #신청서 수락받았다는 알람
      @new_notification = NewNotification.create! user: @apply.user,
                                         content: "#{@post.user.id}님이 신청서를 수락했습니다.",
                                         link: post_path(@post)
    else
   redirect_to "/posts/#{params[:post_id]}/"
 end
 
end
