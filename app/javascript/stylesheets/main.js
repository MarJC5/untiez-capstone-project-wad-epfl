document.addEventListener("turbolinks:load", function(event) {
  /**
  * Toggle button for display quick post creation and search bar in mobile view
  **/

  const container = document.querySelector('.general-header__bottom')
  const searchButton = document.querySelector('.header-search-button')
  const searchBody = document.querySelector('.general-header__bottom__search')



  searchButton.addEventListener('click', () => {
    searchBody.classList.toggle('hidden')


    setTimeout(() => {
      searchBody.classList.toggle('opacity-0')
    }, 100)
  })

})



document.addEventListener("turbolinks:load", function(event) {
  /**
  * Toggle button for display user header links
  **/
  const headerUserCard = document.querySelector('.header-logged-user')
  const headerLinks = document.querySelector('.header-logged-user__links')
  const close = document.querySelector('.user-card-toggle-close')
  const open = document.querySelector('.user-card-toggle-open')

  headerUserCard.addEventListener('click', () => {
    headerLinks.classList.toggle('hidden')
    headerLinks.style.height = '100%'

    setTimeout(() => {
      headerLinks.classList.toggle('opacity-0')
    }, 100)
  })
})


document.addEventListener("turbolinks:load", function(event) {
  /**
  * Toggle flash after few sec
  **/

  const flash = document.querySelector('.hide-alert')

  if(flash != null) {
    setTimeout(() => {
      flash.classList.toggle('opacity-0')
    }, 1800)

    setTimeout(() => {
      flash.classList.toggle('hidden')
      flash.style.zIndex = 0;
    }, 3000)
  }


})


document.addEventListener("turbolinks:load", function(event) {
  /**
  * Toggle follow & following list
  **/

  try {
    const followBtn = document.querySelector('#btn--follow')
    const followingBtn = document.querySelector('#btn--following')
    const followList = document.querySelector('.followees')
    const followingList = document.querySelector('.followers')

    followingBtn.addEventListener('click', () => {
      followList.classList.toggle('hidden')
      followBtn.classList.toggle('font-bold')

      followingList.classList.toggle('hidden')
      followingBtn.classList.toggle('font-bold')

    })

    followBtn.addEventListener('click', () => {
      followList.classList.toggle('hidden')
      followBtn.classList.toggle('font-bold')

      followingList.classList.toggle('hidden')
      followingBtn.classList.toggle('font-bold')
    })

  } catch(error){
      //console.log("No follow buttons on this page")
  }


})

document.addEventListener("turbolinks:load", function(event) {
  /**
  * Toggle post creation view
  **/

  try {
    const postType = document.querySelector('#post_category_id')
    const form = document.querySelector('#post-creation-form')
    const imageField = document.querySelector('.post-form-image-field')

    switch (postType.value) {
      case "1":
        console.log('Create new post')
        form.classList.remove(...form.classList)
        form.classList.toggle('post-category-form')
        break;
      case "2":
        console.log('Create new tips')
        form.classList.remove(...form.classList)
        form.classList.toggle('tips-category-form')
        break;
      case "3":
        console.log('Create new trip-proposal')
        form.classList.remove(...form.classList)
        form.classList.toggle('trip-proposal-category-form')
        break;
      case "4":
        console.log('Create new photoshoot')
        form.classList.remove(...form.classList)
        form.classList.toggle('photoshoot-category-form')
        break;
      default:
        console.log('Create new post')
    }

    postType.addEventListener('change', (event) => {

      switch (event.target.value) {
        case "1":
          console.log('Create new post')
          form.classList.remove(...form.classList)
          form.classList.toggle('post-category-form')
          imageField.required = false;
          break;
        case "2":
          console.log('Create new tips')
          form.classList.remove(...form.classList)
          form.classList.toggle('tips-category-form')
          imageField.required = false;
          break;
        case "3":
          console.log('Create new trip-proposal')
          form.classList.remove(...form.classList)
          form.classList.toggle('trip-proposal-category-form')
          imageField.required = false;
          break;
        case "4":
          console.log('Create new photoshoot')
          form.classList.remove(...form.classList)
          form.classList.toggle('photoshoot-category-form')
          imageField.required = true;
          break;
        default:
          console.log('Create new post')
      }
    })
  } catch (e) {
    //console.log('Not post creation page')
  }

})

document.addEventListener("turbolinks:load", function(event) {
  /**
  * Toggle display short mobile login popup
  **/

  try {
    const closeBtn = document.querySelector('#short-login-mobile')
    const shortLogin = document.querySelector('#login-request-screen')

    closeBtn.addEventListener('click', () => {
      shortLogin.classList.toggle('hidden')
    })


  } catch(error){
      //console.log("No follow buttons on this page")
  }


})

document.addEventListener("turbolinks:load", function(event) {
  /**
  * Display password update for user
  **/

  try {
    const userPassword = document.querySelector('.user_password')
    const updateBtn = document.querySelector('.form-btn-validation')

    userPassword.addEventListener('change', function(event) {
      if (userPassword.value !== null || undefined) {
        updateBtn.classList.toggle('btn--disabled')
        updateBtn.classList.toggle('hidden')
      }
    }
  )

  } catch(error){
      //console.log("No password buttons on this page")
  }


})
