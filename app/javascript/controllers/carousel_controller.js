import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["carousel"]

    connect() {
        this.index = 0
        this.update()
    }

    next() {
        const total = this.carouselTarget.children.length
        this.index = (this.index + 1) % total
        this.update()
    }

    prev() {
        const total = this.carouselTarget.children.length
        this.index = (this.index - 1 + total) % total
        this.update()
    }

    update() {
        this.carouselTarget.style.transform = `translateX(-${this.index * 100}%)`
    }
}
