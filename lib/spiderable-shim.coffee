if !Function.prototype.bind
  Function.prototype.bind = (oThis) ->
    if (typeof this != 'function')
      throw new TypeError('Function.prototype.bind - what is trying to be bound is not callable')

    aArgs = Array.prototype.slice.call(arguments, 1)
    fToBind = this
    fNOP = ->
    fBound = ->
      fToBind.apply(this instanceof fNOP && oThis?this:oThis, aArgs.concat(Array.prototype.slice.call(arguments)))

    fNOP.prototype = this.prototype
    fBound.prototype = new fNOP()

    fBound
