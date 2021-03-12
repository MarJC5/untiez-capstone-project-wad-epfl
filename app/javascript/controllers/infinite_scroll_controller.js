import { Controller } from "stimulus"
import Rails from '@rails/ujs';

export default class extends Controller {
  // Target in the hmtl to activate the function
  static targets = [ "entries", "pagination" ]

  scroll() {
    // Check the next pagination button a the bottom, if not present stop the following function
    let next_page = this.paginationTarget.querySelector("a[rel='next']")
    if(next_page == null){return}

    let url = next_page.href

    // Check the window height to compare the scroll height to bottom
    const body = document.body
    const html = document.documentElement
    const height = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight)

    // Check if we are at the bottom of the page
    if (window.pageYOffset >= height - window.innerHeight - 1) {
      this.loadMore(url)
    }
  }

  // Ask Rails to send us to next page with an AJAX request
  loadMore(url){
    Rails.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
      success: (data) => {
        // Add post to the existing page without reload
        this.entriesTarget.insertAdjacentHTML('beforeend', data.entries)
        // Change the pagination url target without reolad the page
        const oldNav = document.querySelector('.pagination')
        this.paginationTarget.removeChild(oldNav)
        this.paginationTarget.insertAdjacentHTML('beforeend', data.pagination)
      }
    })
  }
}
