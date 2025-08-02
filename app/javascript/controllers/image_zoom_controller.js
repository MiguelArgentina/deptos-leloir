import { Controller } from "@hotwired/stimulus"
import mediumZoom from "medium-zoom"

export default class extends Controller {
    static targets = ["zoomable"]

    connect() {
        console.log("ImageZoomController connected", this.zoomableTargets)
        this.zoom = mediumZoom(this.zoomableTargets, {
            container: document.body, // ✅ Ensures full-screen zoom container
            background: 'rgba(0, 0, 0, 0.8)',
            scrollOffset: 40
        })
    }

    disconnect() {
        if (this.zoom) this.zoom.detach()
    }
}
