import Rails from "@rails/ujs"
import "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")
import "controllers"

import "stylesheets/application"

document.addEventListener('trix-initialize', e => {
  const editor = e.target.editor
  const endOfContent = editor.getDocument().getLength() - 1
  editor.setSelectedRange(endOfContent)
})
