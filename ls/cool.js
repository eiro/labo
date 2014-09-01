loadPending = ->
    r = new XMHttpRequest!
    r.onload -> (getElementById \slot).innerHTML = this.responseText
    r.open \get \http://example.com true
    r.send!
    r 

