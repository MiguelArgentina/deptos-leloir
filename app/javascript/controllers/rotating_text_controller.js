// app/javascript/controllers/rotating_text_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["text"]

    connect() {
        console.log("RotatingTextController connected")
        this.frases = [
            "Administración",
            "Pague al ingresar",
            "Alquiler temporal",
            "Limpieza incluida",
            "Gestión profesional",
            "Sin intermediarios"
        ]
        this.index = 0
        this.rotate()
        this.interval = setInterval(() => this.rotate(), 3000)
    }

    disconnect() {
        clearInterval(this.interval)
    }

    rotate() {
        if (this.hasTextTarget) {
            this.index = (this.index + 1) % this.frases.length
            this.textTarget.textContent = this.frases[this.index]
        }
    }
}
