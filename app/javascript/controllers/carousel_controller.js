import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["slide"]

    connect() {
        this.index = 0
        this.showCurrentSlide()
    }

    next() {
        this.index = (this.index + 1) % this.slideTargets.length
        this.showCurrentSlide()
    }

    prev() {
        this.index = (this.index - 1 + this.slideTargets.length) % this.slideTargets.length
        this.showCurrentSlide()
    }

    showCurrentSlide() {
        this.slideTargets.forEach((slide, i) => {
            if (i === this.index) {
                slide.classList.remove("opacity-0", "pointer-events-none")
                slide.classList.add("opacity-100")
            } else {
                slide.classList.remove("opacity-100")
                slide.classList.add("opacity-0", "pointer-events-none")
            }
        })
    }
}
