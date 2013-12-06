Router = Backbone.Router.extend
        routes:
                "": "renderMainView"
                "admin": "renderAdminView"

        initialize: ->
                Backbone.history.start pushState: true

        renderMainView: ->
                templateRender "mainTemplate"

        renderAdminView: ->
                templateRender "adminPage"

router = new Router()