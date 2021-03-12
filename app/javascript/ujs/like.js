Likes = {}

// Update like count in view
Likes.liked = function(like) {

  const likeBtn = document.getElementById(`post-button-${like.id}`)
  const likeCount = document.getElementById(`post-count-${like.id}`)

  switch (likeBtn.classList[0]) {
    case "unlike":
        likeBtn.classList.remove("unlike")
        likeBtn.classList.add("like")
        likeBtn.setAttribute('href', `/posts/${like.id}/like.liked`)
        likeCount.textContent = parseInt(like.count)
      break;
    case "like":
      likeBtn.classList.add("unlike")
      likeBtn.classList.remove("like")
        likeBtn.setAttribute('href', `/posts/${like.id}/like.unliked`)
        likeCount.textContent = parseInt(like.count)
      break;
    default:

  }
}

// Update like count in view for mobile has 2 likes components in the view cannot have same ID
Likes.likedMobile = function(like) {

  const likeBtn = document.getElementById(`post-button-${like.id}-mobile`)
  const likeCount = document.getElementById(`post-count-${like.id}-mobile`)

  switch (likeBtn.classList[0]) {
    case "unlike-mobile":
        likeBtn.classList.remove("unlike-mobile")
        likeBtn.classList.add("like-mobile")
        likeBtn.setAttribute('href', `/posts/${like.id}/like.liked`)
        likeCount.textContent = parseInt(like.count)
      break;
    case "like-mobile":
        likeBtn.classList.add("unlike-mobile")
        likeBtn.classList.remove("like-mobile")
        likeBtn.setAttribute('href', `/posts/${like.id}/like.unliked`)
        likeCount.textContent = parseInt(like.count)
      break;
    default:
  }
}
