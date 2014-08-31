loadPending = () ->
    r = new XMLHttpRequest!
    r.onload -> (getElementById \slot).innerHTML = this.responseText
    r.open \get \http://example.com true
    r.send!
