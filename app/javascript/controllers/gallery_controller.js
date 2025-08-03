import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("Gallery controller connected")
        this.gallery = window.lightGallery(this.element, {
            selector: 'a',
            plugins: [lgZoom, lgThumbnail],
            speed: 300,
            zoom: true,
            thumbnail: true
        })
    }

    disconnect() {
        if (this.gallery) this.gallery.destroy()
    }
}
