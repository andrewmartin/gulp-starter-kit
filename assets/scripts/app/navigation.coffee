module.exports =
  class Navigation
    constructor: ->
      @setup()

    overHandler: ($li) ->
      # console.log 'over handler', $li
      # kill existing timeout
      $.doTimeout "resetNav-#{$li.index()}"
      $li.addClass('active')

    outHandler: ($li, timeout = 500) ->
      $.doTimeout "resetNav-#{$li.index()}", timeout, ->
        unless $li.data('active') is true
          $li.removeClass('active')

    subOverHandler: ($li) ->
      $li.data('active', true)

    subOutHandler: ($li) ->
      $li.data('active', false)
      @outHandler($li, 250)

    toggleNewsletter: ->
      $newsletter = $('.site-newsletter')
      if $newsletter.hasClass('active')
        $newsletter.velocity
          height: '0%'
        ,
          duration: 250
          easing: 'easeOutExpo'
          display: 'none'
          complete: -> $newsletter.removeClass('active')
      else
        $newsletter.velocity
          height: '207px'
        ,
          display: 'block'
          duration: 500
          easing: 'easeOutExpo'
          complete: ->
            $newsletter.addClass('active')
            $newsletter.find('input').eq(0).focus()

    toggleSearch: (e) ->
      $search = $('.site-search')
      if $search.hasClass('active')
        $search.velocity
          bottom: '0px'
        ,
          duration: 250
          easing: 'easeOutExpo'
          complete: -> $search.removeClass('active')
      else
        $search.velocity
          bottom: '-72px'
        ,
          display: 'block'
          duration: 500
          easing: 'easeOutExpo'
          complete: ->
            $search.addClass('active')
            $search.find('input').focus()

    bindEvents: ->
      self = @
      $('li.newsletter-toggle a').on "click", (e) ->
        e.preventDefault()
        self.toggleNewsletter $(this)
      $('li.search-toggle a').on "click", (e) ->
        e.preventDefault()
        self.toggleSearch $(this)
      $('#menu-primary > li').hoverIntent(
        ->
          self.overHandler $(this)
        ,
        ->
          self.outHandler $(this), 0
      )
      $('#menu-primary .sub-menu').hoverIntent(
        ->
          self.subOverHandler $(this).closest('li')
        ,
        ->
          self.subOutHandler $(this).closest('li')
      )
      @setHeader()

    setHeader: ->
      @setClass() # set it on page load
      $(window).on "scroll", =>
        @scrolling = true
      .trigger('scroll')

      # http://ejohn.org/blog/learning-from-twitter/](http://ejohn.org/blog/learning-from-twitter
      setInterval =>
        if @scrolling then @setClass()
      , 250

    setClass: ->
      $header = $('#masthead')
      @scrolling = false
      $('body').addClass('scrolled')
      if $('body').scrollTop() >= 600
        unless @animating or @animated
          @animating = true
          $header.css
            top: '-60px'
            opacity: 0
          $header
          .velocity
            top: 0
            opacity: 1
          ,
            duration: 300
            easing: 'easeOutExpo'
            delay: 500
            complete: =>
              @animating = false
              @animated = true
      else
        $('body').removeClass('scrolled')
        @animated = false
    setup: ->
      @bindEvents()
      @skrollr = skrollr.init()
