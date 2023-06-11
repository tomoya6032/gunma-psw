class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user

  def user
    {
      id: object.user.id,
      nickname: object.user.profile.nickname,
      avatar_url: object.user.avatar_url
    }
  end
end
