module.exports =
  class NavCycle
    constructor: (el) ->
      if el
        @el = el
        @pager = $(@el.data('nav'))
        @category = @pager.find('.recipe-category')
        @link = @category.find('a')
        @build()
      else
        throw new Error('no element provided')

    build: ->
      # timeout variations
      max = 8000
      min = 3000
      timeout = Math.floor(Math.random() * (max - min + 1)) + min
      @el.cycle
        slides: "> .recipe-index"
        swipe: true
        swipeFx: "scrollHorz"
        timeout: timeout
        prev: @pager.find('.prev')
        next: @pager.find('.next')
        pauseOnHover: true
        log: false
      .on 'cycle-update-view', (event, optionHash, outgoingSlideEl, incomingSlideEl, forwardFlag) =>
        name = $(incomingSlideEl).data('term-name')
        slug = $(incomingSlideEl).data('term-slug')
        @setClass(name, slug)

    setClass: (name, slug) ->
      @category.find('span').html(name)
      @link.attr('href', "#{siteUrl}/recipes/#{slug}")