Comments = {}

Comments.buildComment = function(comment) {
  // PARENT
  var comments = document.getElementById('comments-post')

  // MAIN
  var commentBody = document.createElement('div')
  commentBody.className = 'comment-card'

  // CONTAINER
  var commentContent = document.createElement('div')
  commentContent.className = 'comment-content'

  // AVATAR
  var userCard = document.createElement('a')
  userCard.className = 'user-card--text'
  userCard.setAttribute('href', `/users/${comment.user}`)

  var userCardContainer = document.createElement('div')
  userCardContainer.className = 'relative'

  var avatarUpload = document.createElement('img')
  avatarUpload.className = 'avatar'
  avatarUpload.setAttribute('src', comment.userAvatarUpload)

  var avatar = document.createElement('img')
  avatar.className = 'avatar'
  avatar.setAttribute('src', `/assets/${comment.userAvatar}`)

  var userInfo = document.createElement('div')
  userInfo.className = 'user-info'

  var userPseudo = document.createElement('p')
  userPseudo.appendChild(document.createTextNode(`@${comment.userPseudo}`))

  var commentDate =  document.createElement('small')
  commentDate.appendChild(document.createTextNode(comment.date))


  // COMMENT TEXT
  var commentText = document.createElement('p')
  commentText.className = 'comment-text'
  commentText.appendChild(document.createTextNode(comment.body))

  // ADD TO PARENT
  commentBody.appendChild(commentContent)

  userCard.appendChild(userCardContainer)

  if (comment.userAvatarUpload) {
    userCardContainer.appendChild(avatarUpload)
  } else {
    userCardContainer.appendChild(avatar)
  }

  userInfo.appendChild(userPseudo)
  userInfo.appendChild(commentDate)
  userCard.appendChild(userInfo)
  commentContent.appendChild(userCard)

  commentContent.appendChild(commentText)

  comments.prepend(commentBody);
}

Comments.count = function(commentCount){
  // UPDATE COMMENTS NUM IN VIEW
  const count = document.querySelectorAll(`.comment-${commentCount.postId}-count`)

  for (let i = 0; i < count.length; i++) {
    count[i].textContent = parseInt(commentCount.count)
  }
}

Comments.clearText = function(newText){
  // CLEAR TEXT CONTENT ON ASYNCH SUBMIT
  const textareaFiled = document.querySelector('#comment_body')

  textareaFiled.value = newText.value
}
