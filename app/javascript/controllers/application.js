import { Application } from "stimulus"


const application = Application.start()
application.debug = false
window.Stimulus = application

export { application }
