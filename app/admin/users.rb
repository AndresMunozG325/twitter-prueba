ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :profile_picture
  #
  # or
  #
  index do
    selectable_column
    id_column
    column :email
    column :name
    column :profile_picture
    column :following do |user|
      user.added_friends.count
    end
    column :tweets do |user|
      user.tweets.count
    end
    column :likes_given do |user|
      user.likes.count
    end
  end
end
