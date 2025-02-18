import { Controller } from "@hotwired/stimulus"
import Rails from '@rails-ujs'
import Turbolinks from 'turbolinks'

Rails.start()
Turbolinks.start()

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}
