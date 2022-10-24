import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search-form"
export default class extends Controller {
  search() {
    if (document.getElementById("query").value.length > 2) {
        clearTimeout(this.timeout);
        this.timeout = setTimeout(() => {
            this.element.requestSubmit();
        }, 1000);
    }
  }
}