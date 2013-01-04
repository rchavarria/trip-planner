package trip.planner



import org.junit.*
import grails.test.mixin.*

@TestFor(FlightController)
@Mock(Flight)
class FlightControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/flight/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.flightInstanceList.size() == 0
        assert model.flightInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.flightInstance != null
    }

    void testSave() {
        controller.save()

        assert model.flightInstance != null
        assert view == '/flight/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/flight/show/1'
        assert controller.flash.message != null
        assert Flight.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/flight/list'


        populateValidParams(params)
        def flight = new Flight(params)

        assert flight.save() != null

        params.id = flight.id

        def model = controller.show()

        assert model.flightInstance == flight
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/flight/list'


        populateValidParams(params)
        def flight = new Flight(params)

        assert flight.save() != null

        params.id = flight.id

        def model = controller.edit()

        assert model.flightInstance == flight
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/flight/list'

        response.reset()


        populateValidParams(params)
        def flight = new Flight(params)

        assert flight.save() != null

        // test invalid parameters in update
        params.id = flight.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/flight/edit"
        assert model.flightInstance != null

        flight.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/flight/show/$flight.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        flight.clearErrors()

        populateValidParams(params)
        params.id = flight.id
        params.version = -1
        controller.update()

        assert view == "/flight/edit"
        assert model.flightInstance != null
        assert model.flightInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/flight/list'

        response.reset()

        populateValidParams(params)
        def flight = new Flight(params)

        assert flight.save() != null
        assert Flight.count() == 1

        params.id = flight.id

        controller.delete()

        assert Flight.count() == 0
        assert Flight.get(flight.id) == null
        assert response.redirectedUrl == '/flight/list'
    }
}
