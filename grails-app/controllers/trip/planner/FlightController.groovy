package trip.planner

import org.springframework.dao.DataIntegrityViolationException

class FlightController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [flightInstanceList: Flight.list(params), flightInstanceTotal: Flight.count()]
    }

    def create() {
        [flightInstance: new Flight(params)]
    }

    def save() {
        def flightInstance = new Flight(params)
        if (!flightInstance.save(flush: true)) {
            render(view: "create", model: [flightInstance: flightInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'flight.label', default: 'Flight'), flightInstance.id])
        redirect(action: "show", id: flightInstance.id)
    }

    def show() {
        def flightInstance = Flight.get(params.id)
        if (!flightInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), params.id])
            redirect(action: "list")
            return
        }

        [flightInstance: flightInstance]
    }

    def edit() {
        def flightInstance = Flight.get(params.id)
        if (!flightInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), params.id])
            redirect(action: "list")
            return
        }

        [flightInstance: flightInstance]
    }

    def update() {
        def flightInstance = Flight.get(params.id)
        if (!flightInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (flightInstance.version > version) {
                flightInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'flight.label', default: 'Flight')] as Object[],
                          "Another user has updated this Flight while you were editing")
                render(view: "edit", model: [flightInstance: flightInstance])
                return
            }
        }

        flightInstance.properties = params

        if (!flightInstance.save(flush: true)) {
            render(view: "edit", model: [flightInstance: flightInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'flight.label', default: 'Flight'), flightInstance.id])
        redirect(action: "show", id: flightInstance.id)
    }

    def delete() {
        def flightInstance = Flight.get(params.id)
        if (!flightInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), params.id])
            redirect(action: "list")
            return
        }

        try {
            flightInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'flight.label', default: 'Flight'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'flight.label', default: 'Flight'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
