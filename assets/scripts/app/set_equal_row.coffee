module.exports =
  class SetEqualRow
    # http://css-tricks.com/equal-height-blocks-in-rows/
    constructor: (el) ->
      if el
        @el = el
        @build()
        $(window).on 'resize', =>
          @build()
      else
        throw new Error('no element provided')

    build: ->
      currentTallest = 0
      currentRowStart = 0
      rowDivs = new Array()
      topPosition = 0

      @el.find('> div').each ->
        $(this).css('height', 'auto')

      @el.find('> div').each ->
        $el = $(this)
        topPostion = $el.position().top
        unless currentRowStart is topPostion

          # we just came to a new row.  Set all the heights on the completed row
          currentDiv = 0
          while currentDiv < rowDivs.length
            rowDivs[currentDiv].height currentTallest
            currentDiv++

          # set the variables for the new row
          rowDivs.length = 0 # empty the array
          currentRowStart = topPostion
          currentTallest = $el.height()
          rowDivs.push $el
        else

          # another div on the current row.  Add it to the list and check if it's taller
          rowDivs.push $el
          currentTallest = (if (currentTallest < $el.height()) then ($el.height()) else (currentTallest))

        # do the last row
        currentDiv = 0
        while currentDiv < rowDivs.length
          rowDivs[currentDiv].height currentTallest
          currentDiv++
